# Vagrant Boxes

> Tested on Windows 7 with VirtualBox 4.3.10, Packer 0.5.2 and Vagrant 1.5.3

## Boxes

All Boxes are server, minimal install and non-desktop

 - Debian 7.5
 - Ubuntu 14.04
 - CentOS 6.5

## Inside

a minimal install

 - pre-installed
   - openssh-server
   - curl
   - nfs-common
   - nfs-utils (centos)
   - sudo (on debian, centos)
   - puppet-common (latest) | puppet (centos)
   - chef (latest)
   - wget (centos)

 - vm-settings
   - DiskSize: 10GB (LVM)
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

```sh
cd vagrant-boxes/packer/ubuntu/ubuntu-14.04-amd64
packer build packer.json
```
or (windows)
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

## License

MIT
