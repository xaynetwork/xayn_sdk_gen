#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $JS_WKDIR_USERS || exit

## npm commands
npm install

cd - || exit