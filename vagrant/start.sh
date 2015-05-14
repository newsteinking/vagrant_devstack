#!/bin/bash
cd /home/stack/devstack
source openrc admin
wget -q http://uec-images.ubuntu.com/precise/current/precise-server-cloudimg-amd64-disk1.img 
/home/stack/devstack/stack.sh
glance image-create --name="Ubuntu12.04" --disk-format=qcow2 --container-format=bare --is-public=true < precise-server-cloudimg-amd64-disk1.img
neutron subnet-update public-subnet --dns_nameservers list=true 8.8.8.8
neutron subnet-update private-subnet --dns_nameservers list=true 8.8.8.8
nova flavor-create m1.tiny2 auto 512 10 1
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default tcp 80 80 0.0.0.0/0
