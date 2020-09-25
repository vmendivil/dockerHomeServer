#!/usr/bin/env bash

#
# This file should be used to create files based on "*.example" templates for new environments.
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

# 2. Create docker network
docker network create t2proxy

# 3. Check if acme.json exists
if [ ! -e ./traefik2proxy/letsencrypt/acme.json ]; then
    echo "Creating acme.json file"
    cp ./traefik2proxy/letsencrypt/acme.json.example ./traefik2proxy/letsencrypt/acme.json
    echo "Updating permission for acme.json to 600"
    sudo chmod 600 ./traefik2proxy/letsencrypt/acme.json
fi

# 4. Check if middlewares exist
if [ ! -e ./traefik2proxy/rules/middlewares-chains.toml ]; then
    echo "Creating middlewares-chains.toml"
    cp ./traefik2proxy/rules/middlewares-chains.toml.example ./traefik2proxy/rules/middlewares-chains.toml
fi

if [ ! -e ./traefik2proxy/rules/middlewares.toml ]; then
    echo "Creating middlewares.toml"
    cp ./traefik2proxy/rules/middlewares.toml.example ./traefik2proxy/rules/middlewares.toml
fi

# 5. Check if traefik.log
if [ ! -e ./traefik2proxy/traefik.log ]; then
    echo "Creating traefik.log"
    cp ./traefik2proxy/traefik.log.example ./traefik2proxy/traefik.log
fi

exit 0