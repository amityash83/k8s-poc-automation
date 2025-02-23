# k8s-poc-automation

k8s-poc-automation for Selenium Test

🚀 Step-by-Step Guide: Deploying POC with Kubernetes, Helm, and ArgoCD

This guide will walk you through deploying a POC on Kubernetes that includes: 

✅ A Flask Web App (API)

✅ Selenium Grid for UI testing

✅ Selenium Test Job for automated tests

✅ Allure Reports for test reporting

✅ ArgoCD for automated GitOps deployment

✅ Exposing services for external access in Docker Desktop Kubernetes (Kind) and Cloud Kubernetes

📂 Folder Structure

```sh
📦 k8s-poc-automation
 ┣ 📂 manifests/             # Raw Kubernetes YAML files
 ┃ ┣ 📜 flask-app.yaml       # Web App Deployment & Service
 ┃ ┣ 📜 selenium-grid.yaml   # Selenium Grid Deployment & Service
 ┃ ┣ 📜 selenium-job.yaml    # Selenium Test Job
 ┃ ┣ 📜 allure-server.yaml   # Allure Reports Service
 ┃ ┣ 📜 ingress.yaml         # Ingress (for Cloud Deployment)
 ┣ 📂 helm/                  # Helm charts (for Cloud Deployment)
 ┃ ┣ 📂 flask-app/
 ┃ ┣ 📂 selenium/
 ┃ ┣ 📂 allure/
 ┣ 📂 scripts/               # Helper scripts for local Kind setup
 ┃ ┣ 📜 deploy-kind.sh       # Deploy all components in Kind
 ┃ ┣ 📜 deploy-cloud.sh      # Deploy all components in Cloud
 ┣ 📂 tests/                 # Selenium Tests
 ┃ ┣ 📜 test_flask_app.py    # Selenium Test Script
 ┣ 📂 docker/                # Dockerfiles for each component
 ┃ ┣ 📜 Dockerfile-flask     # Flask App Dockerfile
 ┃ ┣ 📜 Dockerfile-tests     # Selenium Test Dockerfile
 ┣ 📜 README.md              # Documentation
 ┣ 📜 .gitignore             # Ignore unnecessary files
 ┣ 📜 argocd-app.yaml        # ArgoCD Application Manifest
```

1️⃣ Build and Push Docker Images
📌 Flask App (docker/Dockerfile-flask)
📌 Selenium Test (docker/Dockerfile-tests)

Build and Push Docker Images

```sh
docker build -t your-dockerhub/flask-app -f docker/Dockerfile-flask .
docker push your-dockerhub/flask-app

docker build -t your-dockerhub/selenium-test -f docker/Dockerfile-tests .
docker push your-dockerhub/selenium-test
```

📌 Deploy Selenium Grid with Helm:

```sh
helm install selenium-grid helm/selenium/
```

📌 Deploy Allure Reports with Helm:

```sh
helm install allure helm/allure/
```

📌 Apply ArgoCD Application

```sh
kubectl apply -f argocd-app.yaml
```
