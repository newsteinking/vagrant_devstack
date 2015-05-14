# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "10.3.0.121"
  config.vm.network :forwarded_port, guest: 80, host: 8087
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  config.vm.network :forwarded_port, guest: 9696, host: 9696
  config.vm.network :forwarded_port, guest: 8774, host: 8774
  config.vm.network :forwarded_port, guest: 35357, host: 35357
  config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  vb.gui = false
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  vb.customize ["modifyvm", :id, "--memory", "4096"]

  ## sean
  vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

  end
  
  #config.vm.provision "shell", path: "script.sh"
  config.vm.provision "shell", path: "dev.sh"
end
