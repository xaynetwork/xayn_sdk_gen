#!/bin/bash

cd $JS_WKDIR_DOCUMENTS

npm --endpoint=$ENDPOINT_DOCUMENTS --token=$TOKEN_DOCUMENTS run test

if [ $? -eq 0 ]
then
  export JS_TEST_DOCUMENTS=1
else
  export JS_TEST_DOCUMENTS=0
fi

cd -