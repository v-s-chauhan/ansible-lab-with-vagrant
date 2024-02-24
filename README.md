# Ansible-lab-with-vagrant
**Ansible Lab with Vagrant and KVM**

This project allows you to automatically deploy a small Ansible lab using Vagrant and KVM. It simplifies the process of setting up an environment for testing Ansible playbooks and roles.

**Prerequisites**

Before you begin, ensure you have the following installed on your machine:
    Vagrant
    KVM

**Getting Started**

1. Clone this repository:
    git clone https://github.com/v-s-chauhan/ansible-lab-with-vagrant.git
    cd ansible-lab-with-vagrant
2. Customize the Vagrantfile if needed. You can modify variables such as the number of virtual machines, memory, and CPU
3. Run the following command to start the lab:
    cd vagrant  
    vagrant up  
4. Wait for the setup to complete. Once finished, you will have a fully functional Ansible lab with VMs ready for use.  

**Accessing Virtual Machines**

cnvm01 is the controller node, clvm01, clvm02 etc. are the client machines. These machines can be accessed from the host machine as below:  
    vagrant ssh cnvm01    
    vagrant ssh clvm01  
    vagrant ssh clvm02  

**Testing Ansible from the Controller node.**

Step 1. Logint to the controller node  
   vagrant ssh cnvm01  
   cd ~/src/  
Step 2. Test ansible using ping (from the controller node cnvm01)  
   ./ansible-ping.sh  
Step 3. Execute simple ansible playbook(from the controller node cnvm01)  
   ./yaml-exec.sh  
