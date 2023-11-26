# Coworking Space Service Extension

## Setup

### 1. Create a Cluster

"Add Cluster" on the Amazon Elastic Kubernetes Service.

### 2. Configure a Database

Set up a Postgres database using a Helm Chart.

### 3. Build a Container Image

Create a `Dockerfile` for the Python application. Use a base image that is Python-based.

### 4. Create a Repository

"Create Repository" on the Amazon Elastic Container Registry and push a Docker image into AWS ECR.

### 5. Build a Build Pipeline

"Create build project" on the CodeBuild for Continuous Integration.

### 6. Create a Service and Deployment using Kubernetes

Create a service and deployment using Kubernetes configuration files to deploy the application.

### 7. Review CloudWatch logs

Check AWS CloudWatch for application logs to confirm that an application is operating normally.
