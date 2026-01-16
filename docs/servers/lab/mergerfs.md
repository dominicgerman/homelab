---
icon: lucide/git-merge
---

# Mergerfs

I use mergerfs to create a "pool" several mixed-capacity drives under one mountpoint. I used to have this as my main storage strategy have switched to ZFS in that situation and now use mergerfs for my second copy. This is because I don't have enough drives to do another zfs pool yet but also because this gives me a little bit of "redundancy" in the sense that I haven't put all my eggs in the zfs basket as it were. That seems appropriate for someone who is still pretty new to ZFS and doing it all manually (not in TrueNAS).

```sh
sudo apt install mergerfs -y
```

If you want the latest updates, the command below pulls down the latest version of mergerfs from Github instead of relying on the apt repository which tends to lag behind the latest release. You can run it however often you want. If you already have the latest version, it will do nothing.

```sh
curl -s https://api.github.com/repos/trapexit/mergerfs/releases/latest | grep "browser_download_url.*$(grep VERSION_CODENAME /etc/os-release | cut -d= -f2)_$(dpkg --print-architecture).deb\"" | cut -d '"' -f 4 | wget -qi - && sudo dpkg -i mergerfs_*$(grep VERSION_CODENAME /etc/os-release | cut -d= -f2)_$(dpkg --print-architecture).deb && rm mergerfs_*.deb
```

I also like to put the command in an `update_mergerfs.sh` script and set it to run every 3 months at 3AM on a cron job. Run `sudo crontab -e` to open the crontab for the root user and then add the following line to the end of the file:

```txt
0 3 1 */3 * /path/to/your/update_mergerfs.sh
```

Install `inxi` to identify your drives.

```sh
sudo apt install inxi
inxi -xD  # list drives
ls /dev/disk/by-id # list drives by their immutable ids
```

Then identify the current `sdX` mappings for each drive:

```sh
ls -la /dev/disk/by-id/ata-ST400VN006-3CW104_ZW62V162  # for example
/dev/disk/by-id/ata-ST4000VN006-3CW104_ZW62V162 -> ../../sdb # output
```

Take note of the mappings. We'll need them for our `etc/fstab`.

Run `sudo su` to switch user to `root`.

For new drives (no pre-existing data you want to keep), run `gdisk /dev/sdX` where `X` is the drive you want to format. This will drop you into an interactive session. Follow these instructions:

```txt
Press `o` to create a new empty GPT partition table
  * Proceed? (Y/N) - Y
Press `n` to create a new partition
  * Partition number (1-128, default 1): 1
  * First sector (34-15628053134, default = 2048) or {+-}size{KMGTP}: <leave blank>
  * Last sector (2048-15628053134, default = 15628053134) or {+-}size{KMGTP}: <leave blank>
  * Hex code or GUID (L to show codes, Enter = 8300): 8300
Press `p` to validate that 1 large partition is to be created
  * Model: HGST HDN728080AL
  * Number  Start (sector)    End (sector)  Size       Code  Name
  * 1       2048              15628053134   7.3 TiB    8300  Linux filesystem
Press `w` to write the changes made thus far
  * Until this point, gdisk has been non-destructive
  * Confirm that making these changes is OK and the changes queued so far will be executed
```

After you have done that for all your drives, create an `ext4` filesystem on each drive's newly created partition with `mkfs.ext4 /dev/sdX1`.

Now we can create mountpoints for our new partitions:

```sh
mkdir /mnt/disk{1,2}  # or however many you need
mkdir /mnt/parity1  # adjust this command based on your parity setup
mkdir /mnt/storage  # this will be the main mergerfs mountpoint
```

Finally, we can edit `/etc/fstab` to tell our OS to mount our new partitions to our newly created mountpoints. This will run every time our machine boots. Here's an example:

```txt title="/etc/fstab" linenums="1"
/dev/disk/by-id/ata-WDC_WD100EMAZ-00WJTA0_16G0Z7RZ-part1 /mnt/parity1 ext4 defaults 0 0
/dev/disk/by-id/ata-WDC_WD100EMAZ-00WJTA0_16G10VZZ-part1 /mnt/disk1   ext4 defaults 0 0
/dev/disk/by-id/ata-WDC_WD100EMAZ-00WJTA0_2YHV69AD-part1 /mnt/disk2   ext4 defaults 0 0

/mnt/disk* /mnt/storage fuse.mergerfs defaults,nonempty,allow_other,use_ino,cache.files=off,moveonenospc=true,dropcacheonclose=true,minfreespace=200G,fsname=mergerfs 0 0
```

The last line contains numerous [mergerfs config options](https://trapexit.github.io/mergerfs/config/options/){: target="_blank" }.

In order to reload the new fstab entries you've created and check them before rebooting, use `mount -a`. Then verify the mount points with `df -h`. If you had any existing files on your data disks they will be visible under `/mnt/storage`.

Now's as good a time as any to change the owner of your new mergerfs pool to your non-root user so that when you start using samba and docker, you have write and read permissions at the Debian level:

```sh
sudo chown -R dominic:dominic /mnt/storage/
```
