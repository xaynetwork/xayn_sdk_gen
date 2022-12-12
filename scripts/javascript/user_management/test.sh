#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $JS_WKDIR_USERS || exit

npm --endpoint=$ENDPOINT --token=$TOKEN_USERS run test

cd - || exit