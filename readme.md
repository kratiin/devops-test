# Sample Go Application

## Requirements
- Docker
- Kubernetes
- ArgoCD (for GitOps)

## Docker Commands
1. Build Docker Image:
   ```bash
   docker build -t your-dockerhub-username/sample-app:latest .
   ```
2. Push Image to Docker Hub:
   ```bash
   docker push your-dockerhub-username/sample-app:latest
   ```

## Kubernetes Deployment
- ใช้ Kustomize deploy แอปพลิเคชัน:
  ```bash
  kubectl apply -k kustomize/
  ```
