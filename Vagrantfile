# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.define "tower" do |tower|
		tower.vm.hostname = "tower.linuxlab.lan"
		#tower.dns.tld = "lan"
		#tower.dns.patterns = "tower.linuxlab.lan"
		tower.vm.box = "ansible/tower"
		tower.vm.network "private_network", ip: "192.168.101.10"
		tower.vm.provider "virtualbox" do |vb|
			vb.name = "ansible-tower"
			vb.memory = "4096"
		end
		tower.vm.provision "shell", path: "generate_hosts.sh"
	end

	config.vm.define "gitlab" do |gitlab|
		gitlab.vm.box = "centos/7"
		gitlab.vm.hostname = "gitlab.linuxlab.lan"
		#gitlab.dns.tld = "lan"
		#gitlab.dns.patterns = "gitlab.linuxlab.lan"
		gitlab.vm.network "private_network", ip: "192.168.101.11"
		gitlab.vm.provider "virtualbox" do |vb|
			vb.name = "gitlab"
			vb.cpus = "2"
			vb.memory = "2048"
		end
		gitlab.vm.provision "shell", path: "generate_hosts.sh"
		#gitlab.vm.provision "shell", path: "provisioner.sh"
		gitlab.vm.provision "shell", inline: <<-SHELL
			sudo systemctl disable gitlab-runsvdir.service
			sudo gitlab-ctl stop
			sudo yum install epel-release
			sudo yum -y remove git
			sudo yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
			sudo yum -y install git2u gitlab-runner
		SHELL
	end

	config.vm.define "server01" do |svr|
		svr.vm.box = "centos/7"
		svr.vm.hostname = "server01.linuxlab.lan"
		#svr.dns.tld = "lan"
		#svr.dns.patterns = "server01.linuxlab.lan"
		svr.vm.network "private_network", ip: "192.168.101.21"
		svr.vm.provider "virtualbox" do |vb|
			vb.name = "server01"
			vb.memory = "512"
		end
		svr.vm.provision "shell", path: "generate_hosts.sh"
		svr.vm.provision "shell", inline: <<-SHELL
			sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
			sudo systemctl restart sshd
		SHELL
	end
end
