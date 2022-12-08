#!/usr/bin/env bash
set -e


## remove unwanted output
if [ -d $JS_TEMPLATE_USERS ]; then rm -Rf $JS_WKDIR_USERS/test; fi
rm -Rf $JS_WKDIR_USERS/.travis.yml
rm -Rf $JS_WKDIR_USERS/git_push.sh
cp -R $JS_TEMPLATE_USERS $JS_WKDIR_USERS/test