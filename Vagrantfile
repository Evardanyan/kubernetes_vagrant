Vagrant.configure("2") do |config|

  # Kubernetes master
  config.vm.define "k8s-master" do |master|
    master.vm.box = "ubuntu/bionic64"
    master.vm.network "private_network", type: "static", ip: "192.168.77.10"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
    end
    master.vm.provision "shell", path: "bootstrap-master.sh"
  end
  
  # Kubernetes worker
  config.vm.define "k8s-worker" do |worker|
    worker.vm.box = "ubuntu/bionic64"
    worker.vm.network "private_network", type: "static", ip: "192.168.77.11"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 1
    end
    worker.vm.provision "shell", path: "bootstrap-worker.sh"
  end
end
