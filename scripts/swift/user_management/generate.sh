#!/usr/bin/env bash
set -e
source scripts/swift/common.sh


## run JavaScript codegen
java -jar openapi-generator-cli.jar generate -i user_management.yaml -g $GENERATED_LANG -o $WKDIR_USERS --additional-properties=$GEN_PROPS_USERS $PARAMS
find $WKDIR_USERS -type f -name '*.swift' -exec perl -i -pe 's/import\ MobileCoreServices/import\ FoundationNetworking/g' {} + 