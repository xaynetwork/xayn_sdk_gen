#!/usr/bin/env bash
set -e
source scripts/java/common.sh

## run Java codegen
java -jar openapi-generator-cli.jar generate -i user_management.yaml -g $LANG_JAVA -o $JAVA_WKDIR_USERS --additional-properties=$JAVA_GEN_PROPS_USERS