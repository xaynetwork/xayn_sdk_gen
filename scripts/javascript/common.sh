source global_vars.sh

LANG="javascript"
WKDIR_DOCUMENTS="./targets/$LANG/document_management"
WKDIR_USERS="./targets/$LANG/user_management"
TEMPLATE_DOCUMENTS="./.test/$LANG/document_management/test"
TEMPLATE_USERS="./.test/$LANG/user_management/test"
GEN_PROPS_DOCUMENTS="projectName=$PROJNAME_DOCUMENTS,projectVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,usePromises=true"
GEN_PROPS_USERS="projectName=$PROJNAME_USERS,projectVersion=$VERSION,apiPackage=$PKG_USERS,usePromises=true"