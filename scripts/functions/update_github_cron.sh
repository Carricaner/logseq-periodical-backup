
update_github() {
    # Source the env file
    . "/usr/src/app/.env"

    # Variables
    GITHUB_REMOTE_URL="https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/${GITHUB_REPO_NAME}.git"
    FORMATTED_DATE=$(date +%y-%m-%dT%H:%M:%S)

    if [ "$UPDATE_GITHUB_ENABLED" = true ]
    then 
        # Move to designated place
        cd ${CONTAINER_LOGSEQ_DIR}

        # set up git's parameters
        git config --local user.name "$GIT_USER_NAME"
        git config --local user.email "$GIT_USER_EMAIL"

        # Check if the remote exists
        if ! git remote -v | grep -q "${GIT_REMOTE_ALIAS}"; then
            git remote add "${GIT_REMOTE_ALIAS}" "${GITHUB_REMOTE_URL}"
        fi

        # Add changes
        git add .

        # Commit changes
        git commit -m "Logseq scheduler's update on the time of ${FORMATTED_DATE}"

        # Push changes to remote
        if ! git push "${GIT_REMOTE_ALIAS}" "${GIT_BRANCH}"; then
            echo "Error: Failed to push changes to remote repository" >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
            exit 1
        fi

        # Log
        echo "Github updated on $FORMATTED_DATE." >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
    fi
}