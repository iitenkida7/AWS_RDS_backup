#!/bin/bash
BASE_DIR=$(cd $(dirname $0);pwd)
source ${BASE_DIR}/config

AWS_PROFILE=$1


aws rds describe-db-instances  --profile ${AWS_PROFILE} --out json   \
| jq -r '.DBInstances[] |  .Engine +"\t"+ .DBInstanceIdentifier +"\t"+ .Endpoint.Address + ":" + (.Endpoint.Port | tostring )' 

