#!/bin/bash

cd $JS_WKDIR_USERS

npm --endpoint=$ENDPOINT_USERS --token=$TOKEN_USERS run test

if [ $? -eq 0 ]
then
  JS_TEST_USERS=1
else
  JS_TEST_USERS=0
fi

cd -