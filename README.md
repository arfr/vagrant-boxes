# Vagrant Boxes

> Tested on Windows 7 with VirtualBox 4.3.10, Packer 0.5.2 and Vagrant 1.5.3

## Inside

**pre-installed**
* openssh-server
* curl
* nfs-common
* ntp

**vm-settings**
* Disk Size: 3GB
* CPU: 1
* RAM: 512MB

Timezone is Etc/UTC and system language is EN

## Requirements

* Virtualbox: [https://www.virtualbox.org](https://www.virtualbox.org)
* Vagrant: [http://www.vagrantup.com](http://www.vagrantup.com/)
* Packer: [http://www.packer.io](http://www.packer.io)

## Getting Started

### Clone

````
git clone git@github.com:arfr/vagrant-boxes.git
````

### Build

```sh
cd vagrant-boxes/packer/ubuntu/ubuntu-14.04-server-amd64
packer build packer.json
```

### Boxes

Take a look inside `/vagrant-boxes/boxes/virtualbox/` and you will find `ubuntu-14.04-server-amd64.box` after a successful build.

### Vagrant

```sh
vagrant box add ubuntu-14.04-server-amd64 ./boxes/virtualbox/ubuntu-14.04-server-amd64.box
```

```ruby
config.vm.box = "ubuntu-14.04-server-amd64"
```

## Download

The build boxes are available at [Google Drive](https://googledrive.com/host/0B6dgb1NG97heZDBnRzlVWWRKOE0) you can download it or put the prefered box url inside the Vagrantfile.

```ruby
config.vm.box_url = "https://googledrive.com/host/0B6dgb1NG97heZDBnRzlVWWRKOE0/virtualbox/ubuntu-14.04-server-amd64.box"
```