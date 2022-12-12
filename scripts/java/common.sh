source global_vars.sh

LANG="java"
WKDIR_DOCUMENTS="./targets/$LANG/document_management"
WKDIR_USERS="./targets/$LANG/user_management"
TEMPLATE_DOCUMENTS="./.test/$LANG/document_management/test"
TEMPLATE_USERS="./.test/$LANG/user_management/test"
GEN_PROPS_DOCUMENTS="projectName=$PROJNAME_DOCUMENTS,artifactVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,artifactId=$ID_DOCUMENTS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_DOCUMENTS,modelPackage=$PKG_DOCUMENTS.models"
GEN_PROPS_USERS="projectName=$PROJNAME_USERS,artifactVersion=$VERSION,apiPackage=$PKG_USERS,artifactId=$ID_USERS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_USERS,modelPackage=$PKG_USERS.models"