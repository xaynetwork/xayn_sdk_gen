#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

cd $WKDIR_USERS

npm --endpoint=$ENDPOINT --token=$TOKEN_USERS run test

cd -