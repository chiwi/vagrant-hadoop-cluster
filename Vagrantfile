# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "base-hadoop"
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base-hadoop.pp"
     puppet.module_path = "modules"
     puppet.options = "--verbose --debug --fileserverconfig=/vagrant/fileserver.conf"
  end
  config.vm.provider "virtualbox" do |v|
     v.customize ["modifyvm", :id, "--memory", "1000"]
  end
  
  config.vm.define :backup do |backup_config|
    backup_config.vm.network :private_network, ip: "10.155.4.101"
    backup_config.vm.hostname = "backup"
  end
  
  config.vm.define :hadoop1 do |hadoop1_config|
    hadoop1_config.vm.network :private_network, ip: "10.155.4.102"
    hadoop1_config.vm.hostname = "hadoop1"
  end
  
  config.vm.define :hadoop2 do |hadoop2_config|
    hadoop2_config.vm.network :private_network, ip: "10.155.4.103"
    hadoop2_config.vm.hostname = "hadoop2"
  end
  
  config.vm.define :hadoop3 do |hadoop3_config|
    hadoop3_config.vm.network :private_network, ip: "10.155.4.104"
    hadoop3_config.vm.hostname = "hadoop3"
  end
  
   config.vm.define :master do |master_config|
    master_config.vm.network :private_network, ip: "10.155.4.100"
    master_config.vm.hostname = "master"
  end

end
