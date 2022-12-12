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

function push_to_designated_repo() {
  TARGET_REPO_DOCUMENTS="https://github.com/xaynetwork/xayn_documents_sdk_$1.git"
  TARGET_REPO_USERS="https://github.com/xaynetwork/xayn_users_sdk_$1.git"
  SOURCE_FOLDER_DOCUMENTS="./targets/$1/document_management"
  SOURCE_FOLDER_USERS="./targets/$1/user_management"
  TARGET_FOLDER="./src"

  git clone $TARGET_REPO_DOCUMENTS
  rsync -avz --delete $SOURCE_REPO/$SOURCE_FOLDER_DOCUMENTS $TARGET_REPO_DOCUMENTS/$TARGET_FOLDER
  cd $TARGET_REPO_DOCUMENTS
  git add -A
  git commit -m "Sync from $SOURCE_REPO, version: $VERSION"
  git push
  git tag $VERSION
  git push --tags
  cd -

  git clone $TARGET_REPO_USERS
  rsync -avz --delete $SOURCE_REPO/$SOURCE_FOLDER_USERS $TARGET_REPO_USERS/$TARGET_FOLDER
  cd $TARGET_REPO_USERS
  git add -A
  git commit -m "Sync from $SOURCE_REPO, version: $VERSION"
  git push
  git tag $VERSION
  git push --tags
  cd -
}

# --------------------------
# init section
# --------------------------

# fetch the JAR for codegen if needed
[ ! -f openapi-generator-cli.jar ] &&  curl https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/6.2.1/openapi-generator-cli-6.2.1.jar > openapi-generator-cli.jar
# reset targets directory
if [ -d "./targets" ]; then rm -Rf ./targets; fi
mkdir ./targets


TARGETS=("java" "javascript")

for (( i = 0; i < ${#TARGETS[@]} ; i++ )); do
    target=${TARGETS[$i]}
    printf "\n**** Running: ${target} *****\n\n"

    codegen $target
    push_to_designated_repo $target
done
