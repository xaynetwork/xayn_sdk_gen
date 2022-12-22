#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh

## remove unwanted output
if [ -d $TEMPLATE_DOCUMENTS ]; then rm -Rf $WKDIR_DOCUMENTS/test; fi
rm -Rf $WKDIR_DOCUMENTS/.travis.yml
rm -Rf $WKDIR_DOCUMENTS/git_push.sh
cp -R $TEMPLATE_DOCUMENTS $WKDIR_DOCUMENTS/test

sed -i '/## Getting Started/,$d' $WKDIR_DOCUMENTS/README.md
sed -i -e '$r ./.readme/javascript/back_office.md' -e '$a\' $WKDIR_DOCUMENTS/README.md