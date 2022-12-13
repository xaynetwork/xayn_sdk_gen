#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $WKDIR_USERS || exit

## npm commands
npm install

cd - || exit