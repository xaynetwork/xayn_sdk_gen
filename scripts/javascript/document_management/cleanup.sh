#!/bin/bash

## remove unwanted output
if [ -d $JS_TEMPLATE_DOCUMENTS ]; then rm -Rf $JS_WKDIR_DOCUMENTS/test; fi
rm -Rf $JS_WKDIR_DOCUMENTS/.travis.yml
rm -Rf $JS_WKDIR_DOCUMENTS/git_push.sh
cp -R $JS_TEMPLATE_DOCUMENTS $JS_WKDIR_DOCUMENTS/test