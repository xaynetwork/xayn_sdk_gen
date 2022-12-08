#!/bin/bash

cd $JS_WKDIR_USERS || exit

## npm commands
npx license $LICENSE_NAME
npx gitignore node
npm install

cd - || exit