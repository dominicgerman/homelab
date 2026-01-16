<!-- ---
icon: lucide/cpu
tags:
--- -->
# bee

**My "production" compute node.** 

It's currently only running Jellyfin, Caddy, and Tailscale. The idea is since it's such a low-power device, it can continue running certain services during a power outage since it won't exhaust the battery on my UPS.  

| **Component** | Spec / Rationale                  |
| ------------- | --------------------------------- |
| CPU           | Intel N100 (4C/4T)                |
| RAM           | 16 GB DDR5                        |
| Networking    | Dual 2.5 Gigabit Realtek NICs     |
| Storage       | 512 GB NVME SSD (zfs single disk) |
| OS            | Proxmox 9                         |