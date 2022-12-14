#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $WKDIR_DOCUMENTS || exit

./gradlew test -Dendpoint=$ENDPOINT -Dtoken=$TOKEN_DOCUMENTS --info

cd - || exit