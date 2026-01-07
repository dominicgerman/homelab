# Samba Time Machine Setup

In the past, I have had issues using Samba shares on my NAS as backup targets for Time Machine. Here's the guide I used to set it up.

1. macOS will not use SMB Time Machine shares unless they are advertised via Bonjour mDNS.

    ```sh
    apt install avahi-daemon
    systemctl enable --now avahi-daemon
    ```

2. Create the Time Machine service file

    ```sh
    vim /etc/avahi/services/smb-time-machine.service
    ```

    ```txt
    <?xml version="1.0" standalone='no'?>
    <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
    <service-group>
    <name replace-wildcards="yes">%h Time Machine</name>
    <service>
        <type>_adisk._tcp</type>
        <port>9</port>
        <txt-record>sys=adVF=0x100</txt-record>
        <txt-record>dk0=adVN=TimeMachine,adVF=0x82</txt-record>
    </service>
    </service-group>

    ```

    ```sh
    systemctl restart avahi-daemon
    ```

3. Create your samba config if you haven't already

    ```sh
    vim /etc/samba/smb.conf
    ```

    ```txt
    [global] workgroup = DCG 
        netbios name = nas 
        server string = Proxmox Media Server 
        security = user 
        log file = /var/log/samba/%m.log 
        max log size = 50 
        printcap name = /dev/null 
        load printers = no 
        server min protocol = SMB2
        unix extensions = no
        ea support = yes
        aio read size = 1
        aio write size = 1
        vfs objects = catia fruit streams_xattr
        fruit:advertise_fullsync = true
        fruit:time machine = yes
        fruit:encoding = native 
        fruit:zero_file_id = yes 
        fruit:metadata = stream 
        vfs objects = catia fruit streams_xattr 
        fruit:nfs_aces = no

    [timemachine] 
        comment = Time Machine 
        path = /dpool/timemachine 
        browseable = yes 
        writable = yes 
        public = no 
        guest ok = no 
        fruit:time machine = yes 
        fruit:resource = stream 
        spotlight = no
        fruit:time machine max size = 2T
    ```

    ```sh
    systemctl restart smbd nmbd
    ```

4. If using zfs, run these commands

    ```sh
    zfs set casesensitivity=mixed dpool/timemachine
    zfs set atime=off dpool/timemachine
    zfs set recordsize=1M dpool/timemachine
    zfs set acltype=posixacl dpool/timemachine
    zfs set xattr=sa dpool/timemachine

    chown -R youruser:yourgroup /dpool/timemachine
    chmod -R 770 /dpool/timemachine
    ```

After this is all set, go to System Settings → General → Time Machine and click "Add Backup Disk". Don't "Connect to server" from the Finder. Also, if there’s existing junk in `/dpool/timemachine`, macOS may silently refuse it.
