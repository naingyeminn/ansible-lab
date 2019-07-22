# Ansible Lab

## System Requirements

- CPU: Intel Core i3, Core i5 or equivalents 
- RAM: 8GB (Minimum)
- HDD: 10GB of Free Space
- OS: Linux / MacOS / Windows

> Intel VT-X or Virtualization Technology must be enabled

## Prerequisites

Please install following softwares -

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Git](https://git-scm.com/downloads)


References: 

- [Installing and setting up Vagrant on Windows 10](https://www.youtube.com/watch?v=zHgUQnYpo_g)
- [Installing and setting up Vagrant on Mac OS X](https://www.youtube.com/watch?v=4Ue1WmcHipg)
- [Installing Vagrant on Ubuntu 18.04](https://www.youtube.com/watch?v=bQTBBV-3T6k) 
- [How to install Git on Linux, Mac and Windows](https://www.linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/#install-git)


## Setting up Lab Environment

Run following commands in Terminal (Linux / MacOS) or CMD / Git Bash (Windows)

```sh
git clone https://github.com/naingyeminn/ansible-lab.git
cd ansible-lab
vagrant plugin install vagrant-vbguest
vagrant up
```

Vagrant will create 3 VM Boxes in VirtualBox.

#### ansible-tower

- CPU: 1
- RAM: 4GB
- IP: 192.168.101.10

#### gitlab 

- CPU: 2
- RAM: 2GB
- IP: 192.168.101.11

#### server01

- CPU: 1
- RAM: 512MB
- IP: 192.168.101.21

If you have more CPU Cores and RAM you can customize the VM resources in `Vagrantfile` for better performance.


> Please be warned that the total download size of lab data will be approximately 3GB.


## Ansible Tower License

Please register and get License at [https://www.ansible.com/workshop-license](https://www.ansible.com/workshop-license)

