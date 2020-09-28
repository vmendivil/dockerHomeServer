#!/usr/bin/env bash

#
# This file should be used to start containers
#
# IMPORTANT: 
# This file was created on windows, so throw an error when executed from linux,
#   to fix the issue, run: dos2unix setup_environment.sh
#

docker-compose -f docker-compose-traefik2-all.yml up -d
