#!/bin/bash

set -euo pipefail  # safer bash: exit on error, unset vars are errors

# Define MS dataset 
#
DATA_FILE=$1

# Define the path of the current working directory
#
WORK_PATH=${PWD}

# Define Container to use
#
CONTAINER_NAME="MKPLUSATEDGAR_SHADEMS.simg"

# Define paths
#
DATA_PATH="/bEDD/MPLUS-DATA"
CONT_PATH="/bEDD/MPLUS-CONTAINER"

# Define singularity input
#
CONTAINER="${CONT_PATH}/${CONTAINER_NAME}"
DATADIR="/data"
WORKDIR="/work"


MS_FILE="${DATADIR}/${DATA_FILE}"

# Execute shadems inside singularity
singularity exec --bind ${WORK_PATH}:${WORKDIR} --bind ${DATA_PATH}:${DATADIR} "${CONTAINER}" \
    shadems \
    --xaxis uv \
    --yaxis DATA:amp \
    --corr XX,YY \
    --iter-corr \
    --dir "${WORKDIR}" \
    "${MS_FILE}"
