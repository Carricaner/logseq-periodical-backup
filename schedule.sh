#!/bin/bash

#Source the env file
. "/usr/src/app/.env"

# Variables
GITHUB_REMOTE_URL="https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/${GITHUB_REPO_NAME}.git"
FORMATTED_DATE=$(date +%y-%m-%dT%H:%M:%S)


# Periodically push to github
cd ${CONTAINER_LOGSEQ_DIR}
git config --local user.name "$GIT_USER_NAME"
git config --local user.email "$GIT_USER_EMAIL"
if [ -z `git remote -v | grep ${GIT_REMOTE_ALIAS}` ]
then
    git remote add $GIT_REMOTE_ALIAS $GITHUB_REMOTE_URL
fi
git add .
git commit -m "Logseq scheduler's update on the time of ${FORMATTED_DATE}"
git push $GIT_REMOTE_ALIAS $GIT_BRANCH

# Log
# echo $FORMATTED_DATE >> "${CONTAINER_WORKDIR}/log.txt" 2>&1

echo $FORMATTED_DATE