source global_vars.sh

LANG_JS="javascript"
JS_WKDIR_DOCUMENTS="./targets/$LANG_JS/document_management"
JS_WKDIR_USERS="./targets/$LANG_JS/user_management"
JS_TEMPLATE_DOCUMENTS="./.test/$LANG_JS/document_management/test"
JS_TEMPLATE_USERS="./.test/$LANG_JS/user_management/test"
JS_GEN_PROPS_DOCUMENTS="projectName=$PROJNAME_DOCUMENTS,projectVersion=$VERSION,apiPackage=$PKG_DOCUMENTS,usePromises=true"
JS_GEN_PROPS_USERS="projectName=$PROJNAME_USERS,projectVersion=$VERSION,apiPackage=$PKG_USERS,usePromises=true"