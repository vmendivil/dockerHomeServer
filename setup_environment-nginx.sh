#!/usr/bin/env bash

#
# This file should be used to create files based on "*.example" templates for new environments.
#
# IMPORTANT: 
# This file was created on windows, so throw an error when executed from linux,
#   to fix the issue, run: dos2unix setup_environment.sh
#

# 1. Check if .env file exists
if [ -e .env ]; then
    echo "Loading .env file"
    source .env
else 
    echo "It seems you didn´t create your .env file, so we will create one for you."
    cp .env.example .env
    echo "Configure .env file and execute this process again."
    exit 1
fi

# 2. Create docker networks
docker network create myvpn
docker network create database
docker network create ngproxy

# 3. Check if config.json exists
if [ ! -e ./nginxmanagerproxy/config.json ]; then
    echo "Creating config.json"
    cp ./nginxmanagerproxy/config.json.example ./nginxmanagerproxy/config.json
fi

exit 0
