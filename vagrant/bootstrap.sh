#!/bin/bash

# Update /etc/hosts with IP and hostname information
echo "192.168.121.10 cnvm01" | sudo tee -a /etc/hosts
echo "192.168.121.11 clvm01" | sudo tee -a /etc/hosts
echo "192.168.121.12 clvm02" | sudo tee -a /etc/hosts
echo "192.168.121.13 clvm03" | sudo tee -a /etc/hosts

# Disable strict host checking for SSH
echo -e "Host *\n    StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config

# Configure passwordless SSH from cnvm01 to clvm01, clvm02, clvm03
localts=`date +%d%m%Y`
hostname|grep -q ^cnvm >/dev/null
iscontroller=$?

if [ $iscontroller -eq 0 ] 
	then
#	echo "This is code for controllers only"
	yes|ssh-keygen -t rsa -b 2048 -f /home/vagrant/.ssh/id_rsa -N "" -q
	cd /home/vagrant/src
	cat /home/vagrant/.ssh/id_rsa.pub>cnkey_$localts
	sudo yum install epel-release -y
	sudo yum install ansible -y
	sudo cp /home/vagrant/src/ansible_hosts /etc/ansible/hosts
	sudo cp /home/vagrant/src/http.yml /home/vagrant/http.yml
	else
#	echo "This is code for client VMs"
	sleep 20
	cd /home/vagrant/src/
	cat cnkey_$localts >>/home/vagrant/.ssh/authorized_keys
fi
