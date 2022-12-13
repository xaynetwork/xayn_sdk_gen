source global_vars.sh

LANG="swift"
GENERATED_LANG="swift5"
WKDIR_DOCUMENTS="./targets/$LANG/document_management"
WKDIR_USERS="./targets/$LANG/user_management"
TEMPLATE_DOCUMENTS="./.test/$LANG/document_management/test"
TEMPLATE_USERS="./.test/$LANG/user_management/test"
GEN_PROPS_DOCUMENTS=""
GEN_PROPS_USERS=""
#--library=alamofire
PARAMS=""

create_git_repo() {
    git init
    git config user.email "test@example.com"
    git config user.name "Test Committer"
    git add -A
    git commit -m "initial commit"
    git tag 1.0.0
}