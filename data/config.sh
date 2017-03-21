#!/bin/bash

set -xeu

echo "JBROWSE     : ${JBROWSE}"
echo "JBROWSE_DATA: ${JBROWSE_DATA}"
echo "DATA_DIR    : ${DATA_DIR}"

mkdir -p ${JBROWSE_DATA} || true


if [[ -f "env" ]]; then
    echo "UPDATING ENVIRONMENT WITH CUSTOM VARIABLES"
    source ./env
fi


if [[ -f "${DATA_DIR}jbrowse.conf.addons" ]]; then
    echo "ADDING JBROWSE.CONF ADDONS"
    cat ${DATA_DIR}jbrowse.conf.addons >> ${JBROWSE}jbrowse.conf
else
    echo "NO JBROWSE.CONF ADDONS"
fi



for CFG in ${DATA_DIR}*.cfg; do
    echo "READING CONFIG ${CFG}"
    source ${CFG}
    source ${DATA_DIR}run.scr
    echo "FINISHED READING CONFIG ${CFG}"
done

echo "CREATING SECURITY"
source data/secret.conf

echo "LISTING FILES"
ls ${JBROWSE_DATA}

#${JBROWSE}bin/generate-names.pl --safeMode -v --out ${JBROWSE_DATA} || true

echo "PRINTING CONFIG"
cat ${JBROWSE}jbrowse.conf

HAS_ID=${USER_ID:-}

if [[ ! -z "${HAS_ID}" ]]; then
    echo "CORRECTING USER ID ${USER_ID}"
    chown -R ${USER_ID}:${USER_ID} ${DATA_DIR} &>/dev/null || true
else
    echo "NO USER ID SET"
fi

echo "FINISHED CONFIG.SH"
