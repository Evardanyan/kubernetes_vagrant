#!/bin/bash

# Update and install Docker
sudo apt-get update && sudo apt-get install -y docker.io

# Add the Kubernetes signing key and repository
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF'

# Update package listings and install kubelet, kubeadm, and kubectl
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

# Prevent automatic update
sudo apt-mark hold docker.io kubelet kubeadm kubectl

# Initialize the Kubernetes cluster with the flannel network plugin
sudo kubeadm init --apiserver-advertise-address=192.168.50.10 --pod-network-cidr=10.244.0.0/16

# To start using your cluster, set up local kubeconfig
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Apply the Calico CNI plugin
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# Make sure the kubectl works
kubectl get pods --all-namespaces


# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Verify Helm installation
helm version

# Clean up
rm get_helm.sh

# Make sure the kubectl and Helm works
kubectl get nodes
helm repo add stable https://charts.helm.sh/stable
helm repo update

echo "Bootstrap script execution completed."
