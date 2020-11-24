#!/bin/bash

ENVS=`env`

TARGET_ENVS=''

while read -r p; do

    LINE=$p
    IFS='='
    read -r -a env <<< "$p"
    IFS=''

    NAME="${env[0]}"
    VALUE="${env[1]}"

    if [[ "$NAME" =~ ^(APP_.*)$ ]]; then
        TARGET_ENVS="${TARGET_ENVS}"$'\n'"${NAME}=${VALUE}"
    fi

done <<< "$ENVS"

echo ${TARGET_ENVS}