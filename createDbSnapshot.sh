#!/bin/bash
BASE_DIR=$(cd $(dirname $0);pwd)
source ${BASE_DIR}/config

AWS_PROFILE=$1
RDS_DB_INSTANCE_IDENTIFIER=$2
BACKUP_TIMESTAMP=$(date +"%Y%m%d-%H%M")

#run
aws rds create-db-snapshot \
--db-instance-identifier ${RDS_DB_INSTANCE_IDENTIFIER} \
--db-snapshot-identifier ${SNAPSHOT_PREFIX}-${RDS_DB_INSTANCE_IDENTIFIER}-${BACKUP_TIMESTAMP} \
--out json \
--profile ${AWS_PROFILE} >/dev/null 2>&1
if [ "_${?}" != "_0" ] ; then
	echo -e "failed:\t${SNAPSHOT_PREFIX}-${RDS_DB_INSTANCE_IDENTIFIER}-${BACKUP_TIMESTAMP}"
	exit 1
fi

echo -e "success:\t${SNAPSHOT_PREFIX}-${RDS_DB_INSTANCE_IDENTIFIER}-${BACKUP_TIMESTAMP}"
