#!/usr/bin/env bash
set -e

function codegen() {
  ./scripts/$1/document_management/generate.sh
  ./scripts/$1/user_management/generate.sh
  ./scripts/$1/document_management/cleanup.sh
  ./scripts/$1/user_management/cleanup.sh
  ./scripts/$1/document_management/init.sh
  ./scripts/$1/user_management/init.sh
  ./scripts/$1/document_management/test.sh
  ./scripts/$1/user_management/test.sh
}

# --------------------------
# init section
# --------------------------

# fetch the JAR for codegen if needed
[ ! -f openapi-generator-cli.jar ] &&  curl https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/6.2.1/openapi-generator-cli-6.2.1.jar > openapi-generator-cli.jar
# reset targets directory
if [ -d "./targets" ]; then rm -Rf ./targets; fi
mkdir ./targets

# pull in the latest openapi spec files
ENGINE_REPO="git@github.com:xaynetwork/xayn_discovery_engine.git"
git clone $ENGINE_REPO
cp $ENGINE_REPO/web-api/openapi/document_management.yaml ./
cp $ENGINE_REPO/web-api/openapi/user_management.yaml ./

TARGETS=("java" "javascript")

for (( i = 0; i < ${#TARGETS[@]} ; i++ )); do
    target=${TARGETS[$i]}
    printf "\n**** Running: ${target} *****\n\n"

    codegen $target
done
