#!/usr/bin/env bash
set -e


cd $JAVA_WKDIR_USERS || exit

chmod +x gradlew
./gradlew

cd - || exit