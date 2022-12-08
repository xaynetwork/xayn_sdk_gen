# --------------------------
# init section
# --------------------------

# fetch the JAR for codegen
wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/6.2.1/openapi-generator-cli-6.2.1.jar -O openapi-generator-cli.jar

# reset targets directory
if [ -d "./targets" ]; then rm -Rf ./targets; fi
mkdir ./targets

# --------------------------
# Global vars
# --------------------------

LANG_JS="javascript"
LANG_JAVA="java"

LICENSE_NAME="Apache-2.0"
VERSION="0.0.1"
PKG_DOCUMENTS="com.xayn.documents"
PKG_USERS="com.xayn.users"
ID_DOCUMENTS="xayn_documents_sdk"
ID_USERS="xayn_users_sdk"
ENDPOINT_DOCUMENTS="https://aidokeulnk.execute-api.eu-central-1.amazonaws.com/default"
ENDPOINT_USERS="https://aidokeulnk.execute-api.eu-central-1.amazonaws.com/default"
TOKEN_DOCUMENTS="1LfFzl0ziRIvR0EcnTHW559qQuDdlGl16BHx8oNg"
TOKEN_USERS="1LfFzl0ziRIvR0EcnTHW559qQuDdlGl16BHx8oNg"

# --------------------------
# JavaScript section
# --------------------------

## vars
JS_WKDIR_DOCUMENTS="./targets/$LANG_JS/document_management"
JS_WKDIR_USERS="./targets/$LANG_JS/user_management"
JS_TEMPLATE_DOCUMENTS="./.test/$LANG_JS/document_management/test"
JS_TEMPLATE_USERS="./.test/$LANG_JS/user_management/test"
JS_GEN_PROPS_DOCUMENTS="projectName=xayn_document_management_sdk,projectVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,usePromises=true"
JS_GEN_PROPS_USERS="projectName=xayn_user_management_sdk,projectVersion=$VERSION,apiPackage=$PKG_USERS,usePromises=true"

## run JavaScript codegen
java -jar openapi-generator-cli.jar generate -i document_management.yaml -g $LANG_JS -o $JS_WKDIR_DOCUMENTS --additional-properties=$JS_GEN_PROPS_DOCUMENTS
java -jar openapi-generator-cli.jar generate -i user_management.yaml -g $LANG_JS -o $JS_WKDIR_USERS --additional-properties=$JS_GEN_PROPS_USERS

## remove unwanted output
if [ -d $JS_TEMPLATE_DOCUMENTS ]; then rm -Rf $JS_WKDIR_DOCUMENTS/test; fi
if [ -d $JS_TEMPLATE_USERS ]; then rm -Rf $JS_WKDIR_USERS/test; fi
rm -Rf $JS_WKDIR_DOCUMENTS/.travis.yml
rm -Rf $JS_WKDIR_DOCUMENTS/git_push.sh
rm -Rf $JS_WKDIR_USERS/.travis.yml
rm -Rf $JS_WKDIR_USERS/git_push.sh
cp -R $JS_TEMPLATE_DOCUMENTS $JS_WKDIR_DOCUMENTS/test
cp -R $JS_TEMPLATE_USERS $JS_WKDIR_USERS/test

## npm commands & test
cd $JS_WKDIR_DOCUMENTS
npx license $LICENSE_NAME
npx gitignore node
npm install
npm --endpoint=$ENDPOINT_DOCUMENTS --token=$TOKEN_DOCUMENTS run test 

if [ $? -eq 0 ]
then
  JS_TEST_DOCUMENTS=1
else
  JS_TEST_DOCUMENTS=0
fi

cd -

## npm commands & test
cd $JS_WKDIR_USERS
npx license $LICENSE_NAME
npx gitignore node
npm install
npm --endpoint=$ENDPOINT_USERS --token=$TOKEN_USERS run test

if [ $? -eq 0 ]
then
  JS_TEST_USERS=1
else
  JS_TEST_USERS=0
fi

cd -

if [ $JS_TEST_DOCUMENTS -eq 1 -a $JS_TEST_USERS -eq 1 ]
then
    echo READY
else
    echo NOT READY
fi

# --------------------------
# Java section
# --------------------------

## vars
JAVA_WKDIR_DOCUMENTS="./targets/$LANG_JAVA/document_management"
JAVA_WKDIR_USERS="./targets/$LANG_JAVA/user_management"
JAVA_TEMPLATE_DOCUMENTS="./.test/$LANG_JAVA/document_management/test"
JAVA_TEMPLATE_USERS="./.test/$LANG_JAVA/user_management/test"
JAVA_GEN_PROPS_DOCUMENTS="projectName=xayn_document_management_sdk,artifactVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,artifactId=$ID_DOCUMENTS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_DOCUMENTS,modelPackage=$PKG_DOCUMENTS.models"
JAVA_GEN_PROPS_USERS="projectName=xayn_user_management_sdk,artifactVersion=$VERSION,apiPackage=$PKG_USERS,artifactId=$ID_USERS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_USERS,modelPackage=$PKG_USERS.models"

# run Kotlin codegen
java -jar openapi-generator-cli.jar generate -i document_management.yaml -g $LANG_JAVA -o $JAVA_WKDIR_DOCUMENTS --additional-properties=$JAVA_GEN_PROPS_DOCUMENTS
java -jar openapi-generator-cli.jar generate -i user_management.yaml -g $LANG_JAVA -o $JAVA_WKDIR_USERS --additional-properties=$JAVA_GEN_PROPS_USERS

## commands & test
cd $JAVA_WKDIR_DOCUMENTS
chmod +x gradlew
./gradlew
cd -

## commands & test
cd $JAVA_WKDIR_USERS
chmod +x gradlew
./gradlew
cd -

# --------------------------
# Swift section
# --------------------------

# run Swift codegen
#java -jar openapi-generator-cli.jar generate -i document_management.yaml -g swift5 -o ./targets/swift/document_management --additional-properties=podAuthors=xayn,podDescription=xayn_document_management_sdk,podVersion=0.0.1,projectName=xayn_document_management_sdk
#java -jar openapi-generator-cli.jar generate -i user_management.yaml -g swift5 -o ./targets/swift/user_management --additional-properties=podAuthors=xayn,podDescription=xayn_user_management_sdk,podVersion=0.0.1,projectName=xayn_user_management_sdk