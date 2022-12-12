#!/usr/bin/env bash
set -e
source scripts/java/common.sh

## run Java codegen
java -jar openapi-generator-cli.jar generate -i user_management.yaml -g $LANG -o $WKDIR_USERS --additional-properties=$GEN_PROPS_USERS