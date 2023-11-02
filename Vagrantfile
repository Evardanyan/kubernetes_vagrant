# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Kubernetes master
  config.vm.define "k8s-master" do |master|
    master.vm.box = "ubuntu/bionic64"
    master.vm.network "private_network", ip: "192.168.50.10"
    master.vm.hostname = "k8s-master"
	master.ssh.insert_key = true


    master.vm.provider "virtualbox" do |v|
      v.name = "k8s-master"
      v.memory = 2048
      v.cpus = 2
    end
    master.vm.provision "shell", path: "bootstrap-master.sh"
	 # Synced folder
    master.vm.synced_folder "./data", "/vagrant_data"
  end
  
  # Kubernetes worker
  config.vm.define "k8s-worker" do |worker|
    worker.vm.box = "ubuntu/bionic64"
    worker.vm.network "private_network", ip: "192.168.50.11"
    worker.vm.hostname = "k8s-worker"
	worker.ssh.insert_key = true
    worker.vm.provider "virtualbox" do |v|
      v.name = "k8s-worker"
      v.memory = 2048
      v.cpus = 2
    end
    worker.vm.provision "shell", path: "bootstrap-worker.sh"
	# Synced folder
    worker.vm.synced_folder "./data", "/vagrant_data"
  end
   

end
