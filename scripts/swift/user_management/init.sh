#!/usr/bin/env bash
set -e
source scripts/swift/common.sh

cd $WKDIR_USERS

npx license $LICENSE_NAME
create_git_repo

cd -