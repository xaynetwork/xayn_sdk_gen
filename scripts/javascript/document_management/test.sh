#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $JS_WKDIR_DOCUMENTS || exit

npm --endpoint=$ENDPOINT --token=$TOKEN_DOCUMENTS run test

cd - || exit