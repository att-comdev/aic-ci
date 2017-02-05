#!/bin/bash
set -ex

# openstack services
helm install --name=nova local/nova --set control_replicas=2 --namespace=openstack

# demo images starting at "mitaka"
# helm install --name=cinder local/cinder --set replicas.api=2,images.db_init=quay.io/stackanetes/stackanetes-kolla-toolbox:barcelona,images.db_sync=quay.io/stackanetes/stackanetes-cinder-api:barcelona,images.api=quay.io/stackanetes/stackanetes-cinder-api:barcelona,images.scheduler=quay.io/stackanetes/stackanetes-cinder-scheduler:barcelona,images.volume=quay.io/stackanetes/stackanetes-cinder-volume:barcelona --namespace=openstack

helm install --name=cinder local/cinder --set replicas.api=2 --namespace=openstack

echo "==> TIMING 11m"
