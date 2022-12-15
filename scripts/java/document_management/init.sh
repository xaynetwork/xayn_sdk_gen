#!/usr/bin/env bash
set -e
source scripts/java/common.sh

cd $WKDIR_DOCUMENTS

chmod +x gradlew
./gradlew

cd -