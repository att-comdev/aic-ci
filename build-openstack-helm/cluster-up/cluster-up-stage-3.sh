#!/bin/bash
set -ex

# use default chart images
helm install --name=keystone local/keystone --namespace=openstack --set replicas=2

echo "==> TIMING 6m"
