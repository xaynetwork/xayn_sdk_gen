#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $WKDIR_DOCUMENTS || exit

## npm commands
npm install

cd - || exit