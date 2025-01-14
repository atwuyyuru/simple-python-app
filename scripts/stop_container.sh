#!/bin/bash
set -e

# Stop the running container (if any)
containerid=$(docker ps -q) # Get the container ID of running containers

if [ -n "$containerid" ]; then
  echo "Stopping container: $containerid"
  docker rm -f $containerid
else
  echo "No running containers to stop."
fi
