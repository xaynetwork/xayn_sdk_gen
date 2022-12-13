#!/usr/bin/env bash
set -e
source scripts/swift/common.sh

cd $WKDIR_DOCUMENTS/test
swift test
cd - 