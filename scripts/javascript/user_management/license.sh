#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $JS_WKDIR_USERS

## npm commands
npx license $LICENSE_NAME
npx gitignore node

cd -