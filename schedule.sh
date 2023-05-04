#!/bin/bash

#Source the env file
. "/usr/src/app/.env"

echo "Var: ${CONTAINER_WORKDIR}=-=-+++" >> "${CONTAINER_WORKDIR}/log.txt" 2>&1