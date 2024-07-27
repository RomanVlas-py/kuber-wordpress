#!/bin/bash

kubectl apply -f mariadb/pv-mariadb.yaml -f mariadb/pvc-mariadb.yaml -f mariadb/service-mariadb.yaml -f mariadb/statefulset-mariadb.yaml
kubectl apply -f wordpress/pv-wordpress.yaml -f wordpress/pvc-wordpress.yaml -f wordpress/service-wordpress.yaml -f wordpress/deployment-wordpress.yaml -f wordpress/ingress-wordpress.yaml