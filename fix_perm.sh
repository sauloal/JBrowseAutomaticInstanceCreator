#!/bin/bash

set -xeu

USER_UID=`id -u $USER`

./run.sh chown -R -v ${USER_UID}:${USER_UID} /data$@

