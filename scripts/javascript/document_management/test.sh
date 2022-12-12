#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $WKDIR_DOCUMENTS || exit

npm --endpoint=$ENDPOINT --token=$TOKEN_DOCUMENTS run test

cd - || exit