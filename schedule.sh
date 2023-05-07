#!/bin/bash

#Source the env file
. "/usr/src/app/.env"

# Variables
GITHUB_REMOTE_URL="https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/${logseq-periodical-backup}.git"
FORMATTED_DATE=$(date +%y-%m-%d_%H:%M:%S)

# git operations
git config --local user.name "${GIT_USER_NAME}"
git config --local user.email "${GIT_USER_EMAIL}"
if [ -z `git remote -v | grep ${GIT_REMOTE_ALIAS}` ]
then
    git remote add ${GIT_REMOTE_ALIAS} ${GITHUB_REMOTE_URL}
fi
# git add .

echo "FORMATTED_DATE: ${FORMATTED_DATE}" >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
# echo "${GITHUB_REMOTE_URL}" >> "${CONTAINER_WORKDIR}/log.txt" 2>&1