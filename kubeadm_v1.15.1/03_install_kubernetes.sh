#!/bin/bash

set -e

./use_aliyun_kubernetes_yum_source.sh

#setenforce 0
yum install -y kubernetes-cni-0.7.5-0.x86_64
yum install -y kubelet-1.15.1 kubeadm-1.15.1 kubectl-1.15.1
systemctl enable kubelet && systemctl start kubelet

# Configure cgroup matched with Docker
./configure_cgroup.sh
systemctl daemon-reload
systemctl restart kubelet


# Don't set pause-amd64 image for kubelet service
# Use Kubernetes default pause image


