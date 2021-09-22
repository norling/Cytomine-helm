#!/bin/bash
#
# This script generates keys needed for the deployment
#

echo " - Generating encryption keys"
openssl genrsa -out "configs/software_router/ssh_key" 2>/dev/null
openssl rsa -in "configs/software_router/ssh_key" -pubout -out "configs/software_router/ssh_key.pub" 2>/dev/null
