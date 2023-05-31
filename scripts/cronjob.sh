#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Source the env file
. "/usr/src/app/.env"

# Source the functions
. "/usr/src/app/scripts/functions/update_github_cron.sh"
. "/usr/src/app/scripts/functions/update_folder_cron.sh"

# Function to handle cleanup on script termination
finished() {
  # Perform cleanup actions here
  echo "Script finished!"
}

# Register the finished function to run on script termination
trap finished EXIT

# main function
main() {
    # Update the GitHub
    update_github

    # Update the folder
    update_folder
    
    # exit 0
    exit 0
}

# execute the main function
main