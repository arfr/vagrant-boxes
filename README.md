# Vagrant Boxes

> Tested on Windows 7 with VirtualBox 5.0.0, Packer 0.8.5 and Vagrant 1.7.4

## Boxes

All Boxes are server, minimal install and non-desktop

 - Debian 8.1
 - Debian 7.8
 - Ubuntu 14.04 (14.04.3 LTS)
 - CentOS 7.1.1503 (amd64 only)
 - CentOS 6.7

## Inside

a minimal, server install

 - pre-installed
   - openssh-server
   - curl
   - nfs-common
   - nfs-utils (centos)
   - sudo (on debian, centos)
   - puppet-common (latest) | puppet (centos)
   - wget (centos)

 - vm-settings
   - DiskSize: 40GB (LVM)
   - CPU: 1
   - RAM: 512MB

Timezone is UTC and the system language is EN

## Requirements

 - Virtualbox: [https://www.virtualbox.org](https://www.virtualbox.org)
 - Vagrant: [http://www.vagrantup.com](http://www.vagrantup.com/)
 - Packer: [http://www.packer.io](http://www.packer.io)

## Getting Started

### Clone

````
git clone git@github.com:arfr/vagrant-boxes.git
````

### Build

manual
```sh
cd vagrant-boxes/packer/ubuntu/ubuntu-14.04-amd64
packer build packer.json
```
on windows
```sh
cd vagrant-boxes
build
```

### Boxes

Take a look inside `/vagrant-boxes/boxes/virtualbox/` and you will find `ubuntu-14.04-amd64.box` after a successful build.

### Vagrant

```sh
vagrant box add ubuntu-14.04-amd64 ./boxes/virtualbox/ubuntu-14.04-amd64.box
```

```ruby
config.vm.box = "ubuntu-14.04-amd64"
```

## Download

The build boxes are available at [Google Drive](https://googledrive.com/host/0B6dgb1NG97heZDBnRzlVWWRKOE0) you can download it or put the prefered box url inside the Vagrantfile.

```ruby
config.vm.box_url = "http://boxes.arfr.de/ubuntu-14.04-amd64.box"
```

## TODO

- add hostnames
- Prevent packaged version of VirtualBox Guest Additions being installed (fix deb8.1)
- update Google Drive
- add build.sh (for linux)

## License

MIT
