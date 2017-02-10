#!/bin/bash
set -ex

# openstack services
helm install --name=horizon local/horizon --set network.enable_node_port=true --namespace=openstack

helm install --name=glance local/glance --set replicas.api=2,replicas.registry=2 --namespace=openstack

helm install --name=heat local/heat --namespace=openstack

helm install --name=neutron local/neutron --set replicas.server=2 --namespace=openstack

echo "==> TIMING 10m"
