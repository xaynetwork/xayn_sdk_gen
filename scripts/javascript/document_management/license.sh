#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $JS_WKDIR_DOCUMENTS

## npm commands
yes | npx license $LICENSE_NAME
yes | npx gitignore node

cd -