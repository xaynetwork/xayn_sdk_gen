#!/usr/bin/env bash
set -e
source scripts/swift/common.sh

cd $WKDIR_USERS/test
swift test
cd - 