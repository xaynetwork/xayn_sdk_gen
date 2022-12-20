source global_vars.sh

LANG="swift"
GENERATED_LANG="swift5"
WKDIR_DOCUMENTS="./targets/$LANG/document_management"
WKDIR_USERS="./targets/$LANG/user_management"
TEMPLATE_DOCUMENTS="./.test/$LANG/document_management/test"
TEMPLATE_USERS="./.test/$LANG/user_management/test"
GEN_PROPS_DOCUMENTS="projectName=XaynBackOfficeSdk,podAuthors=xayn.com,podDescription=$PROJNAME_DOCUMENTS,podLicense=$LICENSE_NAME,podVersion=$VERSION"
GEN_PROPS_USERS="projectName=XaynFrontOfficeSdk,podAuthors=xayn.com,podDescription=$PROJNAME_USERS,podLicense=$LICENSE_NAME,podVersion=$VERSION"
PARAMS=""

create_git_repo() {
    git init
    git config user.email "test@example.com"
    git config user.name "Test Committer"
    git add -A
    git commit -m "initial commit"
    git tag 1.0.0
}