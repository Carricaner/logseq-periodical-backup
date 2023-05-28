#!/bin/bash

# Source the env file
. "/usr/src/app/.env"

# Source the functions
. "/usr/src/app/scripts/functions/update_github_cron.sh"
. "/usr/src/app/scripts/functions/update_folder_cron.sh"

# Variables
FORMATTED_DATE=$(date +%y-%m-%dT%H:%M:%S)

# Update the GitHub
update_github_cron

# Update the folder
update_folder_cron

# Log
echo "Scheduleler ran at $FORMATTED_DATE." >> "${CONTAINER_WORKDIR}/log.txt" 2>&1