# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
 
  config.vm.box = "chef/centos-6.5-i386"
  config.vm.boot_timeout = 100000000
  config.vm.define :vm do |vm|
  vm.vm.hostname = "node2"
  vm.vm.network "private_network", ip:"192.168.33.16"
  #vm1.vm.network "forwarded_port", guest: 80, host: 8080
  

end

end
