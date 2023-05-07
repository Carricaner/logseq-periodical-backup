#!/bin/bash

#Source the env file
. "/usr/src/app/.env"

# Variables
GITHUB_REMOTE_URL="https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/${GITHUB_REPO_NAME}.git"
FORMATTED_DATE=$(date +%y-%m-%d_%H:%M:%S)

# Variables checking
echo $CONTAINER_WORKDIR >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
echo $GITHUB_REMOTE_URL >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
echo $FORMATTED_DATE >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
echo $GIT_USER_NAME >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
echo $GIT_USER_EMAIL >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
echo $GIT_REMOTE_ALIAS >> "${CONTAINER_WORKDIR}/log.txt" 2>&1
echo $GITHUB_USERNAME >> "${CONTAINER_WORKDIR}/log.txt" 2>&1

cd ${CONTAINER_WORKDIR}

# git operations
git config --local user.name "$GIT_USER_NAME"
git config --local user.email "$GIT_USER_EMAIL"

if [ -z `git remote -v | grep ${GIT_REMOTE_ALIAS}` ]
then
    git remote add ${GIT_REMOTE_ALIAS} ${GITHUB_REMOTE_URL}
fi

git add .
git reset -- .env
git commit -m "Scheduled build: ${FORMATTED_DATE}"
git push ${GIT_REMOTE_ALIAS} test-git