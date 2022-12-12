#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $WKDIR_DOCUMENTS || exit

chmod +x gradlew
./gradlew

cd -  || exit