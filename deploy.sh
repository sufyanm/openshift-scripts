#!/bin/bash

yum -y update

# Install required packages
yum -y install wget git net-tools bind-utils yum-utils iptables-services \
  bridge-utils bash-completion kexec-tools sos psacct docker

# Install Ansible 2.4.3.0 or newer
yum -y install epel-release
sed -i -e 's/^enabled=1/enabled=0/' /etc/yum.repos.d/epel.repo
yum -y --enablerepo=epel install ansible pyOpenSSL

# Clone openshift-ansible repo
git clone https://github.com/openshift/openshift-ansible ~/openshift-ansible
cd ~/openshift-ansible
git checkout release-3.10

# Run playbooks to deploy cluster
ansible-playbook -i ~/openshift/hosts ~/openshift-ansible/playbooks/prerequisites.yml
ansible-playbook -i ~/openshift/hosts ~/openshift-ansible/playbooks/deploy_cluster.yml
