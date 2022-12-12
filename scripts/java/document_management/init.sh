#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $JAVA_WKDIR_DOCUMENTS || exit

chmod +x gradlew
./gradlew

cd -  || exit