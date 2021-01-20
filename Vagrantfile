# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-hostmanager")
    puts 'Installing vagrant-hostmanager Plugin...'
    system('vagrant plugin install vagrant-hostmanager')
end

  Vagrant.configure(2) do |config|
  
    config.vm.box = "ubuntu/bionic64"
  
    config.vm.define "ubuntu", primary: true do |h|
      h.vm.hostname = "ubuntu"
      h.vm.network "private_network", ip: "192.168.1.120"
      #install kafka
      h.vm.provision :shell, path: "kafka_install_script.sh"
      h.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
      end
    end
  end