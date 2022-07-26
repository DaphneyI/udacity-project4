#!/usr/bin/env bash

# check if command line arguments are passed

# Step 1:
# This is your Docker ID/path
dockerpath=daphdocker/udacity-flaskapp

# Step 2:
# run the container in a kubernetes pod
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: myflaskapp
spec:
  containers:
  - name: myflaskapp
    image: "$dockerpath"
    ports:
      - containerPort: 80
EOF


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/myflaskapp 8000:80



