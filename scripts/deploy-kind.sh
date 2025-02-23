#!/bin/bash
kubectl apply -f manifests/flask-app.yaml
kubectl apply -f manifests/selenium-grid.yaml
kubectl apply -f manifests/selenium-job.yaml
kubectl apply -f manifests/allure-server.yaml
