#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $JAVA_WKDIR_USERS || exit

chmod +x gradlew
./gradlew

cd - || exit