# dominicgerman/homelab

You can find the full site at [homelab.dominicgerman.com](https://homelab.dominicgerman.com).

## Abstract

A wiki format information repository detailing my homelab setup. It is meant to be a resource that anyone can use to create something similar. This site is inspired by [ironicbadger's pms wiki](https://github.com/ironicbadger/pms-wiki).

The primary technologies I use are [Linux](https://www.linux.org/), Containers (via [docker](https://www.docker.com/) and managed using [docker-compose](https://docs.docker.com/compose/)), [Proxmox](https://www.proxmox.com/en/), [Ansible](https://docs.ansible.com/), [mergerfs](https://github.com/trapexit/mergerfs/), [ZFS](https://zfsonlinux.org/) and [SnapRAID](http://www.snapraid.it/). I mostly use Ubiquiti's [Unifi](https://ui.com/) products for networking.

## Doc Site

If you don't already have the Zensical image on your machine:

```sh
docker pull zensical/zensical
```

The server will automatically rebuild the site when you make changes to source files. Start it with:

```sh
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs zensical/zensical
```

The site will be available at `localhost:8000`.

Build a static site from your Markdown files with:

```sh
docker run --rm -it -v ${PWD}:/docs zensical/zensical build
```

To deploy the site, push to `main`, and a GitHub action will do the rest.
