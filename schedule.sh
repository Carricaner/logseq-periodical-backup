#!/bin/bash

#Source the env file
. "/usr/src/app/.env"

echo "Var: ${CONTAINER_WORKDIR}123000" >> "${CONTAINER_WORKDIR}/log.txt" 2>&1