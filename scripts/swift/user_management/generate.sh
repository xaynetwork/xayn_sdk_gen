#!/usr/bin/env bash
set -e
source scripts/swift/common.sh


## run JavaScript codegen
java -jar -DapiDocs=false -DmodelDocs=false openapi-generator-cli.jar generate -i front_office.yaml -g $GENERATED_LANG -o $WKDIR_USERS --additional-properties=$GEN_PROPS_USERS $PARAMS