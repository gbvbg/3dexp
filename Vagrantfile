# -*- mode: ruby -*-
# vi: set ft=ruby :

# MIT License
#
# Copyright (c) [2019] [Grigory Bykov gbykov@hotbox.ru]

Vagrant.configure("2") do |config|
  config.vm.define "host13" do | host13 |
    host13.vm.box = "jborean93/WindowsServer2016"
    host13.vm.network "private_network", ip: "192.168.33.13"
    host13.vm.hostname = "host13"
    host13.vm.provider "virtualbox" do |v|
      v.memory = 1024*10
      v.cpus = 2

      second_disk = './disk13.vdi'

      # Create and attach disk
      unless File.exist?(second_disk)
        v.customize ['createhd', '--filename', second_disk, '--format', 'VDI', '--size', 30 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 0, '--device', 1, '--type', 'hdd', '--medium', second_disk]
    end
    host13.vm.synced_folder ".", "/vagrant", type: "smb"
  end

  config.vm.define "host14" do | host14 |
    host14.vm.box = "jborean93/WindowsServer2016"
    host14.vm.network "private_network", ip: "192.168.33.14"
    host14.vm.hostname = "host14"
    host14.vm.provider "virtualbox" do |v|
      v.memory = 10*1024
      v.cpus = 4
      second_disk = './disk14.vdi'
      # Create and attach disk
      unless File.exist?(second_disk)
        v.customize ['createhd', '--filename', second_disk, '--format', 'VDI', '--size', 30 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 0, '--device', 1, '--type', 'hdd', '--medium', second_disk]
    end
    host14.vm.synced_folder ".", "/vagrant", type: "smb"
  end

  config.vm.define "controller" do |controller|
    controller.vm.box = "centos/7"
    controller.vm.network "private_network", ip: "192.168.33.15"
    controller.vm.hostname = "controller"
    controller.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 1024
      v.cpus = 1
     end
    controller.vm.synced_folder ".", "/vagrant", type: "nfs"
    controller.vm.provision "shell", privileged: false, path: "install_ansible.sh"
    controller.vm.provision "shell", privileged: false, inline: <<-EOF
      if [ ! -f /home/vagrant/.ssh/id_rsa ]; then
        wget --no-check-certificate https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant -O /home/vagrant/.ssh/id_rsa
        wget --no-check-certificate https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/id_rsa.pub
        chmod 600 /home/vagrant/.ssh/id_*
        cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
      fi
      cd /vagrant/provisioning
      export ANSIBLE_HOST_KEY_CHECKING=False
      ansible-playbook setup-all.yml -i dev.ini
    EOF
  end

end
