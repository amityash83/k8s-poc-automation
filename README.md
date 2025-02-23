# k8s-poc-automation

Git Repository Folder Structure

```sh
📦 k8s-poc
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

k8s-poc-automation for Selenium Test

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
