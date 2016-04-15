#!/bin/bash

set -xeu

name=jbrowse_melon

USER_UID=`id -u $USER`

docker run --rm -it --name $name -v $PWD:/data ubuntu:14.04.3 chown -R -v ${USER_UID}:${USER_UID} /data

