#!/bin/bash

ssh kubenode01 "sudo rm -rf /var/lib/openstack-helm/ceph/osd/*"
ssh kubenode01 "sudo rm -rf /var/lib/openstack-helm/ceph/mon/*"
ssh kubenode01 "sudo rm -rf /var/lib/openstack-helm/ceph/ceph/*"

ssh kubenode02 "sudo rm -rf /var/lib/openstack-helm/ceph/osd/*"
ssh kubenode02 "sudo rm -rf /var/lib/openstack-helm/ceph/mon/*"
ssh kubenode02 "sudo rm -rf /var/lib/openstack-helm/ceph/ceph/*"

ssh kubenode03 "sudo rm -rf /var/lib/openstack-helm/ceph/osd/*"
ssh kubenode03 "sudo rm -rf /var/lib/openstack-helm/ceph/mon/*"
ssh kubenode03 "sudo rm -rf /var/lib/openstack-helm/ceph/ceph/*"

ssh kubenode04 "sudo rm -rf /var/lib/openstack-helm/ceph/osd/*"
ssh kubenode04 "sudo rm -rf /var/lib/openstack-helm/ceph/mon/*"
ssh kubenode04 "sudo rm -rf /var/lib/openstack-helm/ceph/ceph/*"

ssh kubenode05 "sudo rm -rf /var/lib/openstack-helm/ceph/osd/*"
ssh kubenode05 "sudo rm -rf /var/lib/openstack-helm/ceph/mon/*"
ssh kubenode05 "sudo rm -rf /var/lib/openstack-helm/ceph/ceph/*"
