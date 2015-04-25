# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
 
  config.vm.box = "chef/centos-6.5-i386"

  config.vm.define :vm1 do |vm1|
  vm1.vm.hostname = "master"
  vm1.vm.network "private_network", ip:"192.168.33.10"
  #vm1.vm.network "forwarded_port", guest: 80, host: 8080
  

end

  config.vm.define :vm2 do |vm2|
  vm2.vm.hostname = "puppet"
  vm2.vm.network "private_network", ip:"192.168.33.11"
  #vm2.vm.network "forwarded_port", guest: 80, host: 9090
  
end


end
