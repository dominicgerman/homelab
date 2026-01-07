# Homelab

This is where I try to keep up-to-date documentation for my homelab. I'm frequently tearing down and rebuilding things and it's nice to have a record of how I usually set things up. Otherwise I wind up searching my ChatGPT/browser history every time I need to find something.

I define my homelab as "the servers, networking gear, and self-hosted applications I'm running both on my LAN and in cloud environments." It could just as easily be defined as "Dom's Linux journey".

Below is a quick overview/inventory of what I'm currently running in my homelab, both hardware and software.

## Software

Coming soon!

## Hardware

### Servers

=== "nas"

    **My primary storage server.**

    This has frequently served as an all-in-one server, both storage and compute. It's had so many different incarnations. The current thinking is "use the lowest cost, least power-hungry components you have and see how far that gets you."

    | **Component** | Spec / Rationale                                      |
    | ------------- | ----------------------------------------------------- |
    | CPU           | AMD Ryzen 5 2600 (6C/12T)                             |
    | Motherboard   | ASRock B450 Pro4                                      |
    | RAM           | 32 GB DDR4-3200                                       |
    | Graphics      | Intel Arc A310 (for hardware accelerated transcoding) |
    | Networking    | 10 Gigabit SFP+ card (Intel X520 chipset)             |
    | Boot drive    | Dual 256 GB SATA SSDs (zfs mirror)                    |
    | Fast storage  | 1 TB NVMe SSD (zfs pool for VMs/containers)           |
    | Bulk storage  | 42TB zfs pool (Four 14TB disks in RAIDZ1)             |
    | More storage  | Two 2TB SATA SSDs (zfs mirror)                        |
    | SATA          | 14 total ports via two SATA expansion cards           |
    | Power         | Rosewill 650W Bronze PSU                              |
    | Cooling       | Standard AMD Box Cooler                               |
    | Case          | RSV-L4500U 4U Server Chassis (12 hotswap drive bays)  |

=== "lab"

    **A second copy of everything on my NAS as well as a playground for VMs and containers.**

    I'm trying out a new thing where I actually back up my main server. Crazy, I know. Now when I need to do maintenance on my main NAS, I can just change one config on my Docker host and cutover to using this "NAS" instead. Uptime!

    | **Component** | Spec / Rationale                             |
    | ------------- | -------------------------------------------- |
    | CPU           | Intel Core i7-10700 (8C/16T)                 |
    | Motherboard   | ASRock Z490M-ITX/ac                          |
    | RAM           | 32 GB DDR4-3200                              |
    | Networking    | 10 Gigabit SFP+ card (Intel X520 chipset)    |
    | Boot drive    | 256 GB NVME SSD (zfs single disk)            |
    | Fast storage  | 1 TB NVMe SSD (zfs pool for VMs/containers)  |
    | Bulk storage  | 28 TB mergerfs pool (non-zfs replica of nas) |
    | Power         | Apevia SFX 500W PSU                          |
    | Cooling       | Standard Intel Box Cooler                    |
    | Case          | Rackchoice 2U Server Chassis                 |

=== "beelink"

    **My "production" compute node.** 
    
    It's currently only running Jellyfin, Caddy, and Tailscale. The idea is since it's such a low-power device, it can continue running certain services during a power outage since it won't exhaust the battery on my UPS.  

    | **Component** | Spec / Rationale                  |
    | ------------- | --------------------------------- |
    | CPU           | Intel N100 (4C/4T)                |
    | RAM           | 16 GB DDR5                        |
    | Networking    | Dual 2.5 Gigabit Realtek NICs     |
    | Storage       | 512 GB NVME SSD (zfs single disk) |
    | OS            | Proxmox 9                         |

### Other Devices

=== "networking"

    | **Component**        | Spec / Rationale                                |
    | -------------------- | ----------------------------------------------- |
    | Modem                | Hitron CODA56 2.5G (ISP provides 2000/300 Mbps) |
    | Router               | Unifi Cloud Gateway Max                         |
    | Core Switch          | Unifi Pro Max 16                                |
    | Access Switch        | Unifi Flex Mini 2.5G                            |
    | WiFi                 | Deco X5000 Mesh (x3)                            |

=== "miscelaneous"

    | Component   | Spec / Rationale                                     |
    | ----------- | ---------------------------------------------------- |
    | PiKVM (DIY) | For remote managment                                 |
    | UPS         | Cyber Power 1500VA                                   |
    | Offsite NAS | Built my brother a NAS, doubles as my offsite backup |
    | Rack        | 12U plywood rack/cabinet (DIY)                       |
