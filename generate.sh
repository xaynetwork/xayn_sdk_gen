#!/usr/bin/env bash
set -e
source global_functions.sh

# Set this to debug the execution of shell commands
# set -o xtrace

prepare

for (( i = 0; i < ${#TARGETS[@]} ; i++ )); do
    target=${TARGETS[$i]}
    printf "\n**** Running: ${target} *****\n\n"

    codegen $target
    push_to_designated_repo $target
done
