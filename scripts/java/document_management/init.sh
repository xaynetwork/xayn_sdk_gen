#!/bin/bash

cd $JAVA_WKDIR_DOCUMENTS || exit

chmod +x gradlew
./gradlew

cd -  || exit