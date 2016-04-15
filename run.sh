#!/bin/bash
#https://hub.docker.com/r/jbrowse/gmod-jbrowse/

set -xeu

NAME=jbrowse_bionano
VER=1.12.1
IMG=jbrowse/gmod-jbrowse:${VER}
#IMG=sauloal/jbrowse_httpd:1.12.1-release

PORT=8006

USER_UID=`id -u ${USER}`

#find . -type d -exec chmod 777 {} \; &>/dev/null

docker stop ${NAME} || true
docker rm   ${NAME} || true


docker run --rm -it            \
--name ${NAME}                 \
-v ${PWD}/data/:/jbrowse/data/ \
-v ${PWD}/data/:/data/         \
-p ${PORT}:80 ${IMG} $@



#--privileged=true              \
#--user=${USER_UID}             \

#${USER}

#docker run --rm -it --NAME $NAME -v $PWD/data/:/data/ -p 8081:80 jbrowse/gmod-jbrowse:1.12.1
#jbrowse/jbrowse-1.12.1

