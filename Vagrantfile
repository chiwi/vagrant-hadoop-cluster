# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "base-hadoop"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base-hadoop.pp"
     puppet.module_path = "modules"
     puppet.options = "--fileserverconfig=/vagrant/fileserver.conf"
  end
  config.vm.provider "virtualbox" do |v|
     v.customize ["modifyvm", :id, "--memory", "1000"]
  end
  
  config.vm.define :hadoop1 do |hadoop1_config|
    hadoop1_config.vm.network :public_network, ip: "10.155.8.101"
    hadoop1_config.vm.hostname = "hadoop1"
  end
  
  config.vm.define :hadoop2 do |hadoop2_config|
    hadoop2_config.vm.network :public_network, ip: "10.155.8.102"
    hadoop2_config.vm.hostname = "hadoop2"
  end
  
  config.vm.define :hadoop3 do |hadoop3_config|
    hadoop3_config.vm.network :public_network, ip: "10.155.8.103"
    hadoop3_config.vm.hostname = "hadoop3"
  end
  
  config.vm.define :hadoop4 do |hadoop4_config|
    hadoop4_config.vm.network :public_network, ip: "10.155.8.104"
    hadoop4_config.vm.hostname = "hadoop4"
  end

  config.vm.define :hadoop5 do |hadoop5_config|
    hadoop5_config.vm.network :public_network, ip: "10.155.8.105"
    hadoop5_config.vm.hostname = "hadoop5"
  end

  config.vm.define :master do |master_config|
    master_config.vm.network :public_network, ip: "10.155.8.100"
    master_config.vm.hostname = "master"
  end

end
