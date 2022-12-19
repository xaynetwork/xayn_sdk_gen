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
  done
}

function push_to_designated_repo() {
  PROJS=("document" "user")
  VERSION=v$(echo "$VERSION" | cut -d '/' -f 3)

  for (( i = 0; i < ${#PROJS[@]} ; i++ )); do
    PROJ=${PROJS[$i]}
    DIR=${PROJ}_management
    TARGET_NAME="$PROJNAME_DOCUMENTS_$1"
    TARGET_REPO="git@github.com:xaynetwork/$TARGET_NAME.git"
    SOURCE_FOLDER="./targets/$1/$DIR"

    # delete target folder if needed
    if [ -d "./$TARGET_NAME" ]; then rm -Rf ./$TARGET_NAME; fi

    # purge project folder
    rm -Rf ./targets/$1/$DIR

    # clean regen for commit
    ./scripts/$1/$DIR/generate.sh
    ./scripts/$1/$DIR/cleanup.sh

    if  [ -f ./scripts/$1/$DIR/license.sh ]; then
      ./scripts/$1/$DIR/license.sh
    else
       cp ./scripts/LICENSE $SOURCE_FOLDER
    fi

    echo Preparing to sync into $TARGET_NAME
    git clone $TARGET_REPO

    # delete old docs/src in repo
    rm -Rf $TARGET_NAME/docs
    rm -Rf $TARGET_NAME/src

    rsync -avz $SOURCE_FOLDER/ $TARGET_NAME
    cd $TARGET_NAME
    ls
    git add -A
    git commit -m "Sync from codegen: version [$VERSION]"
    git push
    git tag $VERSION
    git push --tags
    cd -
    echo Sync into $TARGET_NAME completed
  done
}

function prepare() {
    # fetch the JAR for codegen if needed
    [ ! -f openapi-generator-cli.jar ] &&  curl https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/6.2.1/openapi-generator-cli-6.2.1.jar > openapi-generator-cli.jar
    # reset targets directory
    if [ -d "./targets" ]; then rm -Rf ./targets; fi
    mkdir ./targets
}