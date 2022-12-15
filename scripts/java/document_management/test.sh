#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $WKDIR_DOCUMENTS

./gradlew test -Dendpoint=$ENDPOINT -Dtoken=$TOKEN_DOCUMENTS --info

cd -