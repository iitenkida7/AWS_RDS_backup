#!/bin/bash
BASE_DIR=$(cd $(dirname $0);pwd)
source ${BASE_DIR}/config

AWS_PROFILE=$1

AGO=$(date -u -d "${N_DAY} day ago" '+%s')

LIST=$(${BASE_DIR}/getDbSnapshotList.sh ${AWS_PROFILE} | awk '$3 == "manual" && $4 ~ /^'${SNAPSHOT_PREFIX}'/  {print $0}')

IFS=$'\n'
for ITEM in ${LIST} ; do 

  SNAPSHOT_CLEATE_DATE=$(echo ${ITEM} | awk '{print $5}' |  sed -e "s%T% %g" -e "s%\..*%%g")
  RDS_DB_SNAPSHOT_IDENTIFIER=$(echo ${ITEM} | awk '{print $4}')
  if [ $(date -u -d  "${SNAPSHOT_CLEATE_DATE}" '+%s')  -lt ${AGO} ] ; then
      ${BASE_DIR}/deleteDbSnapshot.sh ${AWS_PROFILE} ${RDS_DB_SNAPSHOT_IDENTIFIER}
  fi

done
