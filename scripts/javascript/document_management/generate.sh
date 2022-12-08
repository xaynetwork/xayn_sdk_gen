## run JavaScript codegen
java -jar openapi-generator-cli.jar generate -i document_management.yaml -g $LANG_JS -o $JS_WKDIR_DOCUMENTS --additional-properties=$JS_GEN_PROPS_DOCUMENTS