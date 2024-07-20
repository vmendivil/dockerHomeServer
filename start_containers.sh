#!/usr/bin/env bash

#
# This file should be used to start containers
#
# IMPORTANT: 
# This file was created on windows, so throw an error when executed from linux,
#   to fix the issue, run: dos2unix setup_environment.sh
#

# Fetch all containers
docker ps -a
# Stop portainer
docker stop portainer
# Delete portainer
docker rm portainer
# Get latest portainer image
docker pull portainer/portainer-ce:latest
# Install portainer
sudo docker compose -f dockerhomeserver-portainer-arm64-v0.yml --env-file dockerhomeserver-portainer-arm64-v0.env up -d

#docker compose -f docker-compose-traefik2-all.yml up -d
#docker compose -f docker-compose-nginx-all.yml up -d
#docker compose -f docker-compose-nginx-all-ubuntu.yml up -d
#docker compose -f docker-compose-traefik2-standalone.yml up -d
