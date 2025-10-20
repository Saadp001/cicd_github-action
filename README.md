# Wisecow

**Wisecow** is a fun, lightweight web server that serves random "wisdom" messages using `fortune` and `cowsay`. It’s built with a simple Bash script and designed for learning CI/CD and Kubernetes deployment workflows.

---

## Features

- Serves random wisdom messages in a cute ASCII cow format.  
- Easy to deploy locally or in a Kubernetes cluster.  
- CI/CD ready with GitHub Actions workflow.  
- Lightweight and minimal dependencies: Bash, `nc`, `fortune`, and `cowsay`.

---

## Prerequisites

Before running locally:

```bash
sudo apt update
sudo apt install fortune cowsay netcat -y

#Running Locally
git clone https://github.com/<your-username>/cicd_github-action.git
cd cicd_github-action
chmod +x app.sh
./app.sh

The server will run on port 4499 by default.
Open your browser and visit: http://localhost:4499


Kubernetes Deployment

Build Docker image:
docker build -t <your-dockerhub-username>/wisecow:v1 .
docker push <your-dockerhub-username>/wisecow:v1

Apply Kubernetes manifests:
kubectl apply -f k8s/


CI/CD

GitHub Actions workflow (.github/workflows/ci-cd.yml) automatically builds and pushes Docker images on commits.

Kubernetes manifests are automatically applied on the cluster when changes are pushed.

Directory Structure
.
├── app.sh               # Main Bash application
├── Dockerfile           # Dockerfile for container image
├── k8s/                 # Kubernetes manifests
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
├── .github/
│   └── workflows/
│       └── ci-cd.yml    # CI/CD GitHub Actions workflow
└── README.md



Notes

Do not commit any secrets (keys, certificates) to the repository.

Use .gitignore to prevent sensitive files from being added.

Fun project intended for learning and experimentation.
