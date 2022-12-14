#!/usr/bin/env bash
set -e
source global_functions.sh

# Set this to debug the execution of shell commands
# set -o xtrace

TARGET=$1
if [ -z "$TARGET" ]; then echo "No target provided"; exit 1; fi
prepare

printf "\n**** Running: ${TARGET} *****\n\n"

codegen $TARGET
push_to_designated_repo $TARGET
