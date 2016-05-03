#!/bin/bash
#https://hub.docker.com/r/jbrowse/gmod-jbrowse/

set -xeu

source config

#find . -type d -exec chmod 777 {} \; &>/dev/null

docker stop ${NAME} || true
docker rm   ${NAME} || true


docker run --rm -it            \
--name ${NAME}                 \
--env "INST_NAME=${NAME}"      \
-v ${PWD}/data/:/jbrowse/data/ \
-v ${PWD}/data/:/data/         \
-p ${PORT}:80 ${IMG} $@

