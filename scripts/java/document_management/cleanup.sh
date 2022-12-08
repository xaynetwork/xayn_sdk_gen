#!/usr/bin/env bash
set -e


## remove unwanted output
#if [ -d $JAVA_TEMPLATE_DOCUMENTS ]; then rm -Rf $JAVA_WKDIR_DOCUMENTS/test; fi
rm -Rf $JAVA_WKDIR_DOCUMENTS/.travis.yml
rm -Rf $JAVA_WKDIR_DOCUMENTS/git_push.sh
#cp -R $JAVA_TEMPLATE_DOCUMENTS $JAVA_WKDIR_DOCUMENTS/test