#!/bin/bash
#https://hub.docker.com/r/jbrowse/gmod-jbrowse/

set -xeu


if [[ ! -f "config"         ]]; then
    echo "NO CONFIG. copying example"
    if [[ -f "config.example" ]]; then
        echo "COPYING EXAMPLE"
        cp config.example config
    else
        echo "NO EXAMPLE. please create manually"
        exit 1
    fi
else
    echo "HAS CONFIG"
fi

source config

#find . -type d -exec chmod 777 {} \; &>/dev/null

docker stop ${NAME} || true
docker rm   ${NAME} || true


docker run --rm -it                \
--name ${NAME}                     \
--env "INST_NAME=${NAME}"          \
--env "INDEX_FILES=${INDEX_FILES}" \
-v ${PWD}/data/:/jbrowse/data/     \
-v ${PWD}/data/:/data/             \
-p ${PORT}:80 ${IMG} $@            | tee -a runs.log

