#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $WKDIR_DOCUMENTS || exit

## npm commands
yes | npx license $LICENSE_NAME
yes | npx gitignore node
npm install

cd - || exit