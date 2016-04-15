#!/bin/bash

set -xeu

#USER_NAME=$(id -u -n)
#USER_ID=$(id -u ${USER_NAME})
#usermod -u ${USER_UID} ${USER_NAME}

#echo USER NAME   ${USER_NAME}
#echo USER ID     ${USER_ID}
#echo USER Ext ID ${USER_UID}
#USER_ID=$(id -u ${USER_NAME})
#echo USER New ID ${USER_ID}


echo "JBROWSE     : ${JBROWSE}"
echo "JBROWSE_DATA: ${JBROWSE_DATA}"
echo "DATA_DIR    : ${DATA_DIR}"

mkdir -p ${JBROWSE_DATA} || true

for CFG in ${DATA_DIR}*.cfg; do
    echo "READING CONFIG ${CFG}"
    bash ${CFG}
    echo "FINISHED READING CONFIG ${CFG}"
done

echo "CREATING SECURITY"
source data/secret.conf

echo "LISTING FILES"
ls ${JBROWSE_DATA}

#${JBROWSE}bin/generate-names.pl --safeMode -v --out ${JBROWSE_DATA} || true

echo "PRINTING CONFIG"
cat ${JBROWSE}jbrowse.conf


echo FINISHED CONFIG.SH

#if [[ ! -z "${USER_UID}" ]]; then
#    chown -R -v ${USER_UID}:${USER_UID} ${DATA_DIR} || true
#fi

