#!/bin/bash

set -x

source openrc

echo "Check for Nova, Cinder"
openstack endpoint list | grep -Ei "Nova|Cinder"

nova hypervisor-list

nova service-list

nova list

cinder service-list

cinder list
