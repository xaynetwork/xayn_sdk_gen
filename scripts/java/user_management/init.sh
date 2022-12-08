#!/bin/bash

cd $JAVA_WKDIR_USERS || exit

chmod +x gradlew
./gradlew

cd - || exit