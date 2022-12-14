#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $WKDIR_USERS || exit

./gradlew test -Dendpoint=$ENDPOINT -Dtoken=$TOKEN_USERS --info

cd - || exit