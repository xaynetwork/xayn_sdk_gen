#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

## run JavaScript codegen
java -jar openapi-generator-cli.jar generate -i back_office.yaml -g $LANG -o $WKDIR_DOCUMENTS --additional-properties=$GEN_PROPS_DOCUMENTS