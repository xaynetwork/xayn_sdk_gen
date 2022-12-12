#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

## run JavaScript codegen
java -jar openapi-generator-cli.jar generate -i document_management.yaml -g $LANG -o $WKDIR_DOCUMENTS --additional-properties=$GEN_PROPS_DOCUMENTS