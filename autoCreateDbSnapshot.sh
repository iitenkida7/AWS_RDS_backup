#!/bin/bash
BASE_DIR=$(cd $(dirname $0);pwd)
source ${BASE_DIR}/config


AWS_PROFILE=$1

LIST=$(${BASE_DIR}/getDbInstances.sh ${AWS_PROFILE})

IFS=$'\n'
for ITEM in ${LIST} ; do
	RDS_DB_INSTANCE_IDENTIFIER=$(echo ${ITEM}|awk '{print $2}')

        ${BASE_DIR}/createDbSnapshot.sh ${AWS_PROFILE} ${RDS_DB_INSTANCE_IDENTIFIER}

done
