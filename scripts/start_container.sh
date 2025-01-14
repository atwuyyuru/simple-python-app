#!/bin/bash

# Fetch Docker credentials from AWS Systems Manager Parameter Store
DOCKER_USERNAME=$(aws ssm get-parameter --name "/pyapp/docker/username" --query "Parameter.Value" --output text)
DOCKER_PASSWORD=$(aws ssm get-parameter --name "/pyapp/docker/password" --with-decryption --query "Parameter.Value" --output text)

# Docker login using the retrieved credentials
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Pull and start the Docker container
docker pull adiwuy/simple-python-flask:latest
docker run -d -p 5000:5000 adiwuy/simple-python-flask:latest
