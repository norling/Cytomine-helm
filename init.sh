#!/bin/bash
#
# This script generates keys needed for the deployment
#

echo "Generating encryption keys"
openssl genrsa -out "configs/software_router/ssh_key" 2>/dev/null
openssl rsa -in "configs/software_router/ssh_key" -pubout -out "configs/software_router/ssh_key.pub" 2>/dev/null

echo "generating message authentication keys"
export ADMIN_PASS=$( uuidgen )
export ADMIN_SEC=$( uuidgen )
export ADMIN_PUB=$( uuidgen )
export SUPERADMIN_SEC=$( uuidgen )
export SUPERADMIN_PUB=$( uuidgen )
export IMS_SEC=$( uuidgen )
export IMS_PUB=$( uuidgen )
export RABBITMQ_SEC=$( uuidgen )
export RABBITMQ_PUB=$( uuidgen )
export SERVER_ID=$( uuidgen )

env_vars='$ADMIN_PASS $ADMIN_SEC $ADMIN_PUB $SUPERADMIN_SEC $SUPERADMIN_PUB $IMS_SEC $IMS_PUB $RABBITMQ_SEC $RABBITMQ_PUB $SERVER_ID'

echo "writing values.yaml file"
envsubst <values.yaml.template "$env_vars" >values.yaml
