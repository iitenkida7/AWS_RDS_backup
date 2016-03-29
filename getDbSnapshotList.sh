#!/bin/bash
BASE_DIR=$(cd $(dirname $0);pwd)
source ${BASE_DIR}/config


AWS_PROFILE=$1

aws rds describe-db-snapshots --profile ${AWS_PROFILE} | \
jq -r '.DBSnapshots[] | .Engine + "\t" + .DBInstanceIdentifier + "\t" + .SnapshotType + "\t" + .DBSnapshotIdentifier + "\t" + .SnapshotCreateTime'

