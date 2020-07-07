#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=victoriariess/microsvrcapi
tag=v0.1

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run make_prediction \
    --generator=run-pod/v1 \
    --image=$dockerpath:$tag 
    --port=80 \
    --labels app=microsvrcapi
  

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward make_prediction 80:80

