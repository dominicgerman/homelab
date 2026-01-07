# Welcome to my doc site

This is where I try to keep up-to-date documentation for my homelab. My homelab is servers, networking gear, and applications I'm running both on my LAN and in the cloud. I'm frequently tearing down and rebuilding things and it's nice to have a record of how I set things up. Otherwise I wind up searching my ChatGPT/browser history every time I need to find something.

## Hardware

### Servers

=== "nas"

    | **Component**           | Spec / Rationale                                               | Cost |
    | ----------------------- | -------------------------------------------------------------- | ---- |
    | CPU                     | AMD Ryzen 5 2600 (6C/12T)                                      | $20  |
    | Motherboard             | Asrock B450 Pro4                                               | $75  |
    | RAM                     | 32 GB DDR4-3200                                                | $50  |
    | PCIe_2 (x16 bifurcated) | Intel Arc A310 (hardware accelerated transcoding)              | $120 |
    | m.2_1 (from PCIe_2)     | 1 TB NVMe SSD (single disk zfs pool for active VMs/containers) | $60  |
    | m.2_2 (from PCIe_2)     | m.2 to 6-port SATA expansion card                              | $30  |
    | PCIe_4 (x16)            | 10 Gb SFP+ card (Intel X520 chipset)                           | $35  |
    | PCIe (x1)               | 4-port SATA expansion card                                     | $30  |
    | Bulk storage (zfs)      | 42TB usable (Four 14TB disks in RAIDZ1)                        | $600 |
    | Backup storage          | Two 2TB SATA SSDs (zfs mirror)                                 | $240 |
    | Power                   | Rosewill 650W Bronze PSU                                       | $50  |
    | Cooling                 | Thermalright Tower Air Cooler                                  | $25  |
    | Case                    | RSV-L4500U 4U Server Chassis (12 hotswap drive bays)           | $270 |
    | **Total cost (USD)**    | ≈ $                                                            |      |


=== "lab"

    **This machine doubles as my backup server and as a testing ground for new apps and technologies.**

    | Device       | Model                                   | Notes                                                                                                                                                |
    | ------------ | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
    | CPU          | AMD Ryzen 9 5900X                       | Bought used with mobo and RAM. I wanted something decently powerful for re-encoding my 4K Blu-ray discs as well as potentially running multiple VMs. |
    | Motherboard  | ASRock B450 PRO4 AM4                    | Definitely on the older side. Looking to upgrade in the near future.                                                                                 |
    | Case         | Rosewill 4U Server Chassis (RSV-L4500U) | Found one on Facebook Marketplace for $100.                                                                                                          |
    | Memory       | 64GB Corsair Vengence LPX DDR4          | Came with the motherboard.                                                                                                                           |
    | Boot drive   | 256GB Samsung NVMe SSD                  | Free99.                                                                                                                                              |
    | Power supply | Thermaltake Smart 500W 80+              | Free99.                                                                                                                                              |

=== "beelink"

    **I use this mini PC to self-host public facing websites and apps. It runs Tailscale, Caddy, Pi-hole, and more.**

    | Device       | Model          | Notes                                                                                                                                     |
    | ------------ | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
    | CPU          | Intel N100     | Something like four (efficiency) cores and maybe eight PCI lanes total. Very low power and perfect for the light workloads it's used for. |
    | Motherboard  | ---            | Has one m.2 slot, dual 2.5G nics, and room for one 2.5" SATA drive.                                                                       |
    | Case         | Beelink EQ12   |                                                                                                                                           |
    | Memory       | 16GB DDR5      | Single channel laptop memory. Officially only supports 16GB but anecdotally supports up to 32GB.                                          |
    | Boot drive   | 500GB NVMe SSD | Came with the machine.                                                                                                                                   |
