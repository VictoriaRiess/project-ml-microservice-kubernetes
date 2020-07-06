#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=<your docker ID>/microsvrcapi:latest
tag=

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker tag microsvrcapi:latest  $dockerpath
#docker tag ml-api:latest $dockerpath
#docker login
docker push $dockerpath

#########################################
#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
#dockerpath=abshaheen/prediction_apptest
# Step 2:  
# Authenticate & tag
#echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
#docker tag 374c533dffbb  $dockerpath:v0.1
#docker login
#docker push $dockerpath

############################################
#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=rishizek/ml-api:latest

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login
docker tag ml-api:latest $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath

############################################
#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=felixgeelhaar/udacity-project-4

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u felixgeelhaar
# Tag 
docker tag udacity-project-4:latest "$dockerpath":1.0.0

# Step 3:
# Push image to a docker repository
docker push "$dockerpath":1.0.0


######################################
Flask
numpy
pandas
scikit-learn==0.20.2
pylint

#############################################
#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=psnx/udacity-predictor
tag=ver.1.0
# Step 2:  
# Authenticate & tag
docker login
docker system info | grep Registry
echo "Docker ID and Image: $dockerpath tag: $tag"
docker tag $dockerpath $dockerpath:$tag
# Step 3:
docker push $dockerpath:$tag

######################################
#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=psnx/udacity-predictor
tag=ver.1.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run predictor\
    --generator=run-pod/v1 \
    --image=$dockerpath:$tag \
    --port=80 \
    --labels app=udacity-predictor

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward predictor 80:80
