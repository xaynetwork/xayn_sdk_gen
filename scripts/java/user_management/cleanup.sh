#!/bin/bash

## remove unwanted output
#if [ -d $JAVA_TEMPLATE_USERS ]; then rm -Rf $JAVA_WKDIR_USERS/test; fi
rm -Rf $JAVA_WKDIR_USERS/.travis.yml
rm -Rf $JAVA_WKDIR_USERS/git_push.sh
#cp -R $JAVA_TEMPLATE_USERS $JAVA_WKDIR_USERS/test