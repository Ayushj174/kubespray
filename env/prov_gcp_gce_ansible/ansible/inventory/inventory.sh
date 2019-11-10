#!/bin/bash
inventory=/home/ayush/kubespray/inventory/mycluster/inventory.ini
echo "[kube-master]" > $inventory
gcloud compute instances list --filter="tags.items=master" --format="value(name)" >> $inventory
echo "[etcd]" >> $inventory
gcloud compute instances list --filter="tags.items=etcd" --format="value(name)" >> $inventory

echo "[kube-node]" >> $inventory
gcloud compute instances list --filter="tags.items=slave" --format="value(name)" >> $inventory

echo "[k8s-cluster:children]" >> $inventory
echo "kube-master" >> $inventory
echo "kube-node" >> $inventory



