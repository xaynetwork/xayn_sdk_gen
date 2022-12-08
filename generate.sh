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

export LANG_JS="javascript"
export LANG_JAVA="java"

export LICENSE_NAME="Apache-2.0"
export VERSION="0.0.1"
export PROJNAME_DOCUMENTS="xayn_document_management_sdk"
export PROJNAME_USERS="xayn_user_management_sdk"
export PKG_DOCUMENTS="com.xayn.documents"
export PKG_USERS="com.xayn.users"
export ID_DOCUMENTS="xayn_documents_sdk"
export ID_USERS="xayn_users_sdk"
export ENDPOINT_DOCUMENTS="https://aidokeulnk.execute-api.eu-central-1.amazonaws.com/default"
export ENDPOINT_USERS="https://aidokeulnk.execute-api.eu-central-1.amazonaws.com/default"
export TOKEN_DOCUMENTS="1LfFzl0ziRIvR0EcnTHW559qQuDdlGl16BHx8oNg"
export TOKEN_USERS="1LfFzl0ziRIvR0EcnTHW559qQuDdlGl16BHx8oNg"

# --------------------------
# JavaScript section
# --------------------------

export JS_WKDIR_DOCUMENTS="./targets/$LANG_JS/document_management"
export JS_WKDIR_USERS="./targets/$LANG_JS/user_management"
export JS_TEMPLATE_DOCUMENTS="./.test/$LANG_JS/document_management/test"
export JS_TEMPLATE_USERS="./.test/$LANG_JS/user_management/test"
export JS_GEN_PROPS_DOCUMENTS="projectName=$PROJNAME_DOCUMENTS,projectVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,usePromises=true"
export JS_GEN_PROPS_USERS="projectName=$PROJNAME_USERS,projectVersion=$VERSION,apiPackage=$PKG_USERS,usePromises=true"

# --------------------------
# Java section
# --------------------------

export JAVA_WKDIR_DOCUMENTS="./targets/$LANG_JAVA/document_management"
export JAVA_WKDIR_USERS="./targets/$LANG_JAVA/user_management"
export JAVA_TEMPLATE_DOCUMENTS="./.test/$LANG_JAVA/document_management/test"
export JAVA_TEMPLATE_USERS="./.test/$LANG_JAVA/user_management/test"
export JAVA_GEN_PROPS_DOCUMENTS="projectName=$PROJNAME_DOCUMENTS,artifactVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,artifactId=$ID_DOCUMENTS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_DOCUMENTS,modelPackage=$PKG_DOCUMENTS.models"
export JAVA_GEN_PROPS_USERS="projectName=$PROJNAME_USERS,artifactVersion=$VERSION,apiPackage=$PKG_USERS,artifactId=$ID_USERS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_USERS,modelPackage=$PKG_USERS.models"

function codegen() {
  ./scripts/$1/document_management/generate.sh
  ./scripts/$1/user_management/generate.sh
  ./scripts/$1/document_management/cleanup.sh
  ./scripts/$1/user_management/cleanup.sh
  ./scripts/$1/document_management/init.sh
  ./scripts/$1/user_management/init.sh
  ./scripts/$1/document_management/test.sh
  ./scripts/$1/user_management/test.sh
}

codegen $LANG_JS
codegen $LANG_JAVA