#!/bin/bash

sudo su - root -c "kubectl create deployment --image nginx my-nginx"
sudo su - root -c "kubectl scale deployment --replicas 2 my-nginx"
sudo su - root -c "kubectl expose deployment my-nginx --port=80 --type=NodePort"
