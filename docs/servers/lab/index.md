<!-- ---
icon: lucide/flask-conical
tags:
--- -->

# lab

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
