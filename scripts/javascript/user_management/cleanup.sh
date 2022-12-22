#!/usr/bin/env bash
set -e
source scripts/javascript/common.sh


## remove unwanted output
if [ -d $TEMPLATE_USERS ]; then rm -Rf $WKDIR_USERS/test; fi
rm -Rf $WKDIR_USERS/.travis.yml
rm -Rf $WKDIR_USERS/git_push.sh
cp -R $TEMPLATE_USERS $WKDIR_USERS/test

sed -i '/## Getting Started/,$d' $WKDIR_USERS/README.md
sed -i -e '$r ./.readme/javascript/front_office.md' -e '$a\' $WKDIR_USERS/README.md