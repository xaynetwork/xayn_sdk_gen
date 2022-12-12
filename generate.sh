#!/usr/bin/env bash
set -e

function codegen() {
  DIRS=("document_management" "user_management")

  for (( i = 0; i < ${#DIRS[@]} ; i++ )); do
    DIR=${DIRS[$i]}

    ./scripts/$1/$DIR/generate.sh
    ./scripts/$1/$DIR/cleanup.sh
    ./scripts/$1/$DIR/init.sh
    ./scripts/$1/$DIR/test.sh
    ./scripts/$1/$DIR/pre_sync.sh
  done
}

function push_to_designated_repo() {
  PROJS=("document" "user")

  for (( i = 0; i < ${#PROJS[@]} ; i++ )); do
    PROJ=${PROJS[$i]}
    TARGET_REPO="git@github.com:xaynetwork/xayn_${PROJ}s_sdk_$1.git"
    SOURCE_FOLDER="./targets/$1/${PROJ}_management"

    echo Preparing to sync into $TARGET_REPO
    git clone $TARGET_REPO
    rsync -avz --delete $SOURCE_REPO/$SOURCE_FOLDER $TARGET_REPO
    cd $TARGET_REPO
    git add -A
    git commit -m "Sync from $SOURCE_REPO, version: $VERSION"
    git push
    git tag $VERSION
    git push --tags
    cd -
    echo Sync into $TARGET_REPO completed
  done
}

# --------------------------
# init section
# --------------------------

# fetch the JAR for codegen if needed
[ ! -f openapi-generator-cli.jar ] &&  curl https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/6.2.1/openapi-generator-cli-6.2.1.jar > openapi-generator-cli.jar
# reset targets directory
if [ -d "./targets" ]; then rm -Rf ./targets; fi
mkdir ./targets


#TARGETS=("java" "javascript")
TARGETS=("javascript")

for (( i = 0; i < ${#TARGETS[@]} ; i++ )); do
    target=${TARGETS[$i]}
    printf "\n**** Running: ${target} *****\n\n"

    codegen $target
    push_to_designated_repo $target
done
