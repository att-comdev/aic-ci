#!/bin/bash

set -x

echo "===> TIMING 16m"

source openrc

nova list | awk '$2 && $2 != "ID" {print $2}' | xargs -n1 nova delete || echo "Nothing to delete"
sleep 10
neutron port-list | awk '$2 && $2 != "id" {print $2}' | xargs -n1 neutron port-delete || echo "Nothing to delete"
sleep 10
neutron net-list | awk '$2 && $2 != "id" {print $2}' | xargs -n1 neutron net-delete || echo "Nothing to delete"
sleep 10
cinder list | awk '$2 && $2 != "ID" {print $2}' | xargs -n1 cinder delete || echo "Nothing to delete"
sleep 10

helm delete nova --purge
helm delete neutron --purge
helm delete heat --purge
helm delete glance --purge
helm delete cinder --purge
helm delete rabbitmq --purge
helm delete memcached --purge
helm delete horizon --purge
helm delete keystone --purge
helm delete bootstrap-ceph --purge
helm delete bootstrap-openstack --purge
helm delete mariadb --purge

for x in `kubectl get pv | grep openstack | awk '{print $1}' | grep pvc`; do kubectl delete pv/${x}; done;

sleep 300

helm delete ceph --purge

kubectl delete namespace openstack
kubectl delete namespace ceph
kubectl delete storageclass/general

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
