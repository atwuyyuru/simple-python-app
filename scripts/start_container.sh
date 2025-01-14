#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull adiwuy/simple-python-flask


# Run the Docker image as a container
docker run -d -p 5000:5000 adiwuy/simple-python-flask
