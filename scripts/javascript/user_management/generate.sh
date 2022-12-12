#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh


## run JavaScript codegen
java -jar openapi-generator-cli.jar generate -i user_management.yaml -g $LANG_JS -o $JS_WKDIR_USERS --additional-properties=$JS_GEN_PROPS_USERS