# Operationalize a machine learning Application
This project focuses on deploying a machine learning application written in flask.
The application serves out predictions (inference) about housing prices through API calls.

## Requirements
To run this project you need to have the following installed
- python3.7 
- docker
- hadolint

## How to use
### run locally
First, setup the virtual environment
```bash
make setup
```
Next, install application dependencies
```bash
make install
```
run the application
```
python app.py
```
Once the application is running, to make predictions, run the following in a different terminal.
```
./make_predicitons.sh
```


### run with docker
Run application in a doker container
```
./run_docker.sh
```
Make predicitons. ie run it in a different terminal 
```
./make_predictions.sh
```


## run with kubernetes
Push image to docker repo
```
./upload_docker.sh <docker-username> <docker-password>
```
Run container in a kubernetes pod
```
./run_kubernetes.sh
```
Make prediction
```
./make_predicitons.sh
```

## Files in this repo
- makefile: contains commands to simplify some of the steps in the project like creating the virtual environmnet, linting etc
- run_docker.sh: this script buids and runs a docker cobtainer using the built image
- upload.sh: script that pushes the afore created image to a specified docker hub repository
- run_kubernetes.sh: creates a secret with the docker information and created a pod using the pushed image
- app.py: python application reponsible for taking in data and making predictions
- requirements.rxt: dependencies of the machine learning app
