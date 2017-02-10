#!/bin/bash
set -ex

# for glance and cinder
echo "Creating ceph volumes to hold glance images and cinder volumes"
kubectl exec ceph-mon-0 -t -i -n ceph ceph osd pool create images 64
kubectl exec ceph-mon-0 -t -i -n ceph ceph osd pool create volumes 64

# db
helm install --name=mariadb local/mariadb --namespace=openstack

# infra
helm install --name=memcached local/memcached --namespace=openstack
helm install --name=rabbitmq local/rabbitmq --namespace=openstack

echo "==> TIMING: 11 min"
