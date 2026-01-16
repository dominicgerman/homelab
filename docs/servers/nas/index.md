<!-- ---
icon: lucide/hard-drive
tags:
--- -->

# nas

**My primary storage server.**

This has frequently served as an all-in-one server, both storage and compute. It's had so many different incarnations. The current thinking is "use the lowest cost, least power-hungry components you have and see how far that gets you."

| **Component** | Spec / Rationale                                      |
| ------------- | ----------------------------------------------------- |
| CPU           | AMD Ryzen 3 Pro 4350G (4C/8T)                             |
| Motherboard   | ASRock B450 Pro4                                      |
| RAM           | 32 GB DDR4-3200                                       |
| Networking    | 10 Gigabit SFP+ card (Intel X520 chipset)             |
| Boot drive    | Dual 256 GB SATA SSDs (zfs mirror)                    |
| Fast storage  | 1 TB NVMe SSD (zfs pool for VMs/containers)           |
| Bulk storage  | 42TB zfs pool (Four 14TB disks in RAIDZ1)             |
| More storage  | Two 2TB SATA SSDs (zfs mirror)                        |
| SATA          | 14 total ports via two SATA expansion cards           |
| Power         | Rosewill 650W Bronze PSU                              |
| Cooling       | Standard AMD Box Cooler                               |
| Case          | RSV-L4500U 4U Server Chassis (12 hotswap drive bays)  |