#!/bin/bash

set -e

# Uninstall installed docker
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine


# Set up repository
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Use Aliyun Docker
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo


# Install docker
# on a new system with yum repo defined, forcing older version and ignoring obsoletes introduced by
yum install -y --setopt=obsoletes=0 \
   docker-ce-18.06.3.ce-3.el7 docker-client-18.06.3.ce-3.el7 docker-common-18.06.3.ce-3.el7\

systemctl enable docker
systemctl start docker

docker version


# Use Aliyun docker registry
./use_aliyun_docker_registry.sh

