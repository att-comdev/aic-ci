#!/bin/bash
set -ex

# ceph
helm install --name=ceph local/ceph --namespace=ceph

# bootstrap
helm install --name=bootstrap-ceph local/bootstrap --namespace=ceph
helm install --name=bootstrap-openstack local/bootstrap --namespace=openstack

echo "==> TIMING: 5m"
