#!/bin/bash
BASE_DIR=$(cd $(dirname $0);pwd)
source ${BASE_DIR}/config

AWS_PROFILE=$1
RDS_DB_SNAPSHOT_IDENTIFIER=$2

#run
aws rds delete-db-snapshot --db-snapshot-identifier ${RDS_DB_SNAPSHOT_IDENTIFIER}
--out json \
--profile ${AWS_PROFILE} >/dev/null 2>&1

