# homelab-wiki

You can find the full site at [dominicgerman.github.io/homelab](https://dominicgerman.github.io/homelab).

## Abstract

A wiki format information repository detailing my homelab setup. It is meant to be a resource that anyone can use to create something similar. This site is inspired by [ironicbadger's pms wiki](https://github.com/ironicbadger/pms-wiki).

The primary technologies I use are [Linux](https://www.linux.org/), Containers (via [docker](https://www.docker.com/) and managed using [docker-compose](https://docs.docker.com/compose/)), [Proxmox](https://www.proxmox.com/en/), [Ansible](https://docs.ansible.com/), [mergerfs](https://github.com/trapexit/mergerfs/), [ZFS](https://zfsonlinux.org/) and [SnapRAID](http://www.snapraid.it/). I mostly use Ubiquiti's [Unifi](https://ui.com/) products for networking.

## Usage

If writing and wanting to run a local copy of the wiki, run:

```bash
pip3 install -U -r requirements.txt

mkdocs serve
```

The site will be available at `localhost:8000`.

## Deployment

To deploy the site, push to `main`, and a GitHub action will do the rest.

## Contributing

To contribute, open a PR, and I will review it. Gratefully received!
