#!/usr/bin/env bash
set -e


cd $JAVA_WKDIR_DOCUMENTS || exit

chmod +x gradlew
./gradlew

cd -  || exit