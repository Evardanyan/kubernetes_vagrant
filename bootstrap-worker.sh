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

# Mark them to hold (prevent automatic update)
sudo apt-mark hold docker.io kubelet kubeadm kubectl


