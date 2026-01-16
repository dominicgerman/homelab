---
icon: lucide/computer
---

# Desktop

I thought I'd include my desktop system as it is a PC build running a Debian-based operating system and therefore, quite similar to the other devices in my homelab.

I wanted to have a client device (other than my Macbook) that I could use for things like bakcing up my media collection with MakeMKV and re-encoding it with Handbrake. I bought a used Ryzen 9 5900X platform with that in mind and after much shuffling around, I'm now using it for exactly that. I threw in an Intel Arc A310 and I couldn't be happier with the result: low-power draw, stable graphics in GNOME, and 250+ frames per second when doing Handbrake encodes using the Quick Sync AV1 encoder.

I got the case and power supply on FB for $50 total which was a great cost-saving move. The case isn't great though and the fans I have in there right now do get a little noisy so I'll probably switch them out soon.

The motherboard was originally meant to be in my `nas` build as it has eight onboard SATA ports, two m.2 slots, and four (physical) x16 PCIe slots. The only reason it isn't in the `nas` build is that the mobo in my NAS at the moment won't fit in my desktop case.

| **Component** | Spec / Rationale                                      |
| ------------- | ----------------------------------------------------- |
| CPU           | AMD Ryzen 9 5900X (12C/24T)                           |
| Motherboard   | MSI Pro B550M-VC WIFI                                 |
| RAM           | 64 GB DDR4-3200                                       |
| Graphics      | Intel Arc A310 (for hardware accelerated transcoding) |
| Networking    | 10 Gigabit SFP+ card (Intel X520 chipset)             |
| Boot drive    | 256 GB NVMe SSD                                       |
| Fast storage  | 1 TB NVMe SSD                                         |
| Power         | EVGA 750W Gold PSU                                    |
| Cooling       | Thermalright Assassin X 120 Refined SE                |
| Case          | Fractal Design Core 1000 Mid Tower                    |
| OS            | Ubuntu Desktop 25.10                                  |

