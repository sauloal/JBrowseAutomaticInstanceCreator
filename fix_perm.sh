#!/bin/bash

set -xeu

USER_ID=`id -u $USER`

./run.sh chown -R -v ${USER_ID}:${USER_ID} /data$@

