source global_vars.sh

LANG_JAVA="java"
JAVA_WKDIR_DOCUMENTS="./targets/$LANG_JAVA/document_management"
JAVA_WKDIR_USERS="./targets/$LANG_JAVA/user_management"
JAVA_TEMPLATE_DOCUMENTS="./.test/$LANG_JAVA/document_management/test"
JAVA_TEMPLATE_USERS="./.test/$LANG_JAVA/user_management/test"
JAVA_GEN_PROPS_DOCUMENTS="projectName=$PROJNAME_DOCUMENTS,artifactVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,artifactId=$ID_DOCUMENTS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_DOCUMENTS,modelPackage=$PKG_DOCUMENTS.models"
JAVA_GEN_PROPS_USERS="projectName=$PROJNAME_USERS,artifactVersion=$VERSION,apiPackage=$PKG_USERS,artifactId=$ID_USERS,asyncNative=true,serializableModel=true,serializationLibrary=gson,snapshotVersion=$VERSION,groupId=com.xayn,licenseName=$LICENSE_NAME,invokerPackage=$PKG_USERS,modelPackage=$PKG_USERS.models"
