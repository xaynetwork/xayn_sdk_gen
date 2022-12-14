#!/usr/bin/env bash
set -e
source scripts/swift/common.sh

cd $WKDIR_DOCUMENTS

# npx gets stuck on mac os sometimes
# yes | npx license $LICENSE_NAME
create_git_repo

cd -