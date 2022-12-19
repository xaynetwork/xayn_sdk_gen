#!/usr/bin/env bash
set -e

source scripts/swift/common.sh

## run JavaScript codegen
java -jar openapi-generator-cli.jar generate -i back_office.yaml -g $GENERATED_LANG -o $WKDIR_DOCUMENTS --additional-properties=$GEN_PROPS_DOCUMENTS $PARAMS
