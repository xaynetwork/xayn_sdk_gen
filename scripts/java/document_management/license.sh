#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $WKDIR_DOCUMENTS || exit

## npm commands
yes | npx license $LICENSE_NAME

cd - || exit