#!/bin/bash

set -euo pipefail  # safer bash: exit on error, unset vars are errors

# Define MS dataset 
DATA_FILE="J0521+1638_cal.ms"

# Define the path of the current working directory
OUTPUT_DEST="/bEDD/u/HRK/TEST_RUNS/"

# Define Container to use
CONTAINER_NAME="MKPLUSATEDGAR.simg"

# Define paths
BIND_SRC="/bEDD/MPLUS-DATA/"
BIND_DEST="/data"
#
CONTAINER="/bEDD/MPLUS_CONTAINER/${CONTAINER_NAME}"
MS_FILE="${BIND_DEST}/${DATA_FILE}"

# Execute shadems inside singularity
singularity exec --bind ${BIND_SRC}:${BIND_DEST} "${CONTAINER}" \
    shadems \
    --xaxis uv \
    --yaxis DATA:amp \
    --corr XX,YY \
    --iter-corr \
    --dir "${OUTPUT_DEST}" \
    "${MS_FILE}"
