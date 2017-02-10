#!/bin/bash

set -x

source openrc
# for glance
# now handled in ./cluster-up/cluster-up-stage-2.sh
# echo "Creating ceph volumes to hold glance images and cinder volumes"
# kubectl exec ceph-mon-0 -t -i -n ceph ceph osd pool create images 64
# kubectl exec ceph-mon-0 -t -i -n ceph ceph osd pool create volumes 64

echo "Creating ubuntu precise glance image"
glance image-create --name "Ubuntu Precise" --disk-format qcow2 --container-format bare --file /home/bjozsa/LAB/demo/trusty-server-cloudimg-amd64-disk1.img --visibility public --progress

# no flavors in nova
echo "Creating basic openstack flavor"
openstack flavor create --public m1.normal --id auto --ram 1024 --disk 60 --vcpus 1 --rxtx-factor 1

# allow port 22 and icmp
echo "Updating default security groups to allow icmp and ssh"
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0

# create network
echo "Creating neutron networks"
neutron net-create flat-network --provider:physical_network=physnet1 --provider:network_type=flat --shared
neutron subnet-create flat-network 192.168.5.0/24 --name flat-subnet

# create key (make sure to ssh-keygen first)
echo "Importing ssh key for VMs"
openstack keypair create --public-key ~/.ssh/id_rsa.pub test-key
