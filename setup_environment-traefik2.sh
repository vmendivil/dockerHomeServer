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
docker network create t2proxy
docker network create myvpn
docker network create database
# docker network create ngproxy

# 3. Check if acme.json exists
if [ ! -e ./traefik2proxy/letsencrypt/acme.json ]; then
    echo "Creating acme.json file"
    cp ./traefik2proxy/letsencrypt/acme.json.example ./traefik2proxy/letsencrypt/acme.json
fi

# 3.1 Set acme.json permissions
if [ -e ./traefik2proxy/letsencrypt/acme.json ]; then
    echo "Updating permission for acme.json to 600"
    sudo chmod 600 ./traefik2proxy/letsencrypt/acme.json
fi

# 4. Check if middlewares-chains exist
if [ ! -e ./traefik2proxy/rules/middlewares-chains.toml ]; then
    echo "Creating middlewares-chains.toml"
    cp ./traefik2proxy/rules/middlewares-chains.toml.example ./traefik2proxy/rules/middlewares-chains.toml
fi

# 4.1 Check if middlewares exist
if [ ! -e ./traefik2proxy/rules/middlewares.toml ]; then
    echo "Creating middlewares.toml"
    cp ./traefik2proxy/rules/middlewares.toml.example ./traefik2proxy/rules/middlewares.toml
fi

# 5. Check if traefik.log exists
if [ ! -e ./traefik2proxy/traefik.log ]; then
    echo "Creating traefik.log"
    cp ./traefik2proxy/traefik.log.example ./traefik2proxy/traefik.log
fi

# 6. Check if service-openmediavault exists
#if [ ! -e ./traefik2proxy/rules/service-openmediavault.toml ]; then
#    echo "Creating service-openmediavault.toml"
#    cp ./traefik2proxy/rules/service-openmediavault.toml.example ./traefik2proxy/rules/service-openmediavault.toml
#    echo "Ensure to properly configure OMV service parameters"
#fi

exit 0
