#!/bin/bash

set -euo pipefail  # safer bash: exit on error, unset vars are errors

# Define MS dataset 
#
# DATA_FILE_NAME=$1
#
DATA_FILE_NAME="J0521+1638_cal.ms"

# Define the path of the current working directory
#
# WORK_PATH=$2
#
WORK_PATH="/bEDD/u/HRK/my_EDGAR_RUN/"

# Define Container to use
#
# CONTAINER_NAME=$3
#
CONTAINER_NAME="MKPLUSATEDGAR.simg"

# Define paths
#
DATA_PATH="/bEDD/MPLUS-DATA/"
CONT_PATH="/bEDD/MPLUS-CONTAINER"

# Define singularity input
#
CONTAINER="${CONT_PATH}/${CONTAINER_NAME}"
DATADIR="/data"
WORKDIR="/work"


MS_FILE="${BIND_DEST}/${DATA_FILE}"

# Execute shadems inside singularity
singularity exec --bind ${WORK_PATH}:${WORKDIR} --bind ${DATA_PATH}:${DATADIR} "${CONTAINER}" \
    shadems \
    --xaxis uv \
    --yaxis DATA:amp \
    --corr XX,YY \
    --iter-corr \
    --dir "${OUTPUT_DEST}" \
    "${MS_FILE}"
