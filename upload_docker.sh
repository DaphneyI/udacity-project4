#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# make sure the user name and password are passed in as cli arguments
if [ $# -ne 2 ]; then
        echo "error"
        echo "Usage: ./upload_docker.sh <docker username> <docker password>"
		exit 1
fi

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=$1/udacity-flaskapp
echo "Docker ID and Image: $dockerpath"

# Step 2:  
# Authenticate & tag
echo $2 | docker login --username $1 --password-stdin
docker tag udacity-flaskapp $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath


