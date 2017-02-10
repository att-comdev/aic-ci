#!/bin/bash

set -x

source openrc

echo "Check for Glance, Keystone, Neutron, Heat"
openstack endpoint list

glance image-list

neutron agent-list | grep L3
neutron agent-list | grep DHCP
neutron agent-list | grep Open
