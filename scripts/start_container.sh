#!/bin/bash
#set -e

# Pull the Docker image from Docker Hub
#docker pull adiwuy/simple-python-flask-app

# Run the Docker image as a container
#docker run -d -p 5000:5000 adiwuy/simple-python-flask-app

set -e

# Check if any container is using port 5000 and stop/remove it
containerid=$(docker ps -q --filter "publish=5000")

if [ -n "$containerid" ]; then
  echo "Stopping and removing container: $containerid"
  docker rm -f $containerid || true  # Ignore errors if container is already stopped
else
  echo "No containers found on port 5000."
fi

# Pull the latest image
echo "Pulling the latest image..."
docker pull adiwuy/simple-python-flask-app:latest

# Run the container on port 5000
echo "Starting the container..."
docker run -d -p 5000:5000 adiwuy/simple-python-flask-app:latest
