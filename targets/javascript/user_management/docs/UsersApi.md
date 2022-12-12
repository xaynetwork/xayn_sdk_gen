# XaynUserManagementSdk.UsersApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**documentInteraction**](UsersApi.md#documentInteraction) | **PATCH** /users/{user_id}/interactions | Add interaction between a user and a document
[**getPersonalizedDocuments**](UsersApi.md#getPersonalizedDocuments) | **GET** /users/{user_id}/personalized_documents | Get personalized documents for the user



## documentInteraction

> documentInteraction(userId, opts)

Add interaction between a user and a document

The interaction is used to provide personalized documents to the user.

### Example

```javascript
import XaynUserManagementSdk from 'xayn_user_management_sdk';
let defaultClient = XaynUserManagementSdk.ApiClient.instance;
// Configure API key authorization: ApiKeyAuth
let ApiKeyAuth = defaultClient.authentications['ApiKeyAuth'];
ApiKeyAuth.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//ApiKeyAuth.apiKeyPrefix = 'Token';

let apiInstance = new XaynUserManagementSdk.UsersApi();
let userId = "userId_example"; // String | Id of the user
let opts = {
  'userInteractionRequest': new XaynUserManagementSdk.UserInteractionRequest() // UserInteractionRequest | 
};
apiInstance.documentInteraction(userId, opts).then(() => {
  console.log('API called successfully.');
}, (error) => {
  console.error(error);
});

```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| Id of the user | 
 **userInteractionRequest** | [**UserInteractionRequest**](UserInteractionRequest.md)|  | [optional] 

### Return type

null (empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## getPersonalizedDocuments

> PersonalizedDocumentsResponse getPersonalizedDocuments(userId, opts)

Get personalized documents for the user

Returns a list of documents personalized for the given &#x60;user_id&#x60;. Each document contains the id, the score and the properties that are attached to the document. The score is a value between 0 and 1 where a higher value means that the document matches the preferences of the user better.

### Example

```javascript
import XaynUserManagementSdk from 'xayn_user_management_sdk';
let defaultClient = XaynUserManagementSdk.ApiClient.instance;
// Configure API key authorization: ApiKeyAuth
let ApiKeyAuth = defaultClient.authentications['ApiKeyAuth'];
ApiKeyAuth.apiKey = 'YOUR API KEY';
// Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
//ApiKeyAuth.apiKeyPrefix = 'Token';

let apiInstance = new XaynUserManagementSdk.UsersApi();
let userId = "userId_example"; // String | Id of the user
let opts = {
  'count': 10 // Number | Maximum number of personalized documents to return
};
apiInstance.getPersonalizedDocuments(userId, opts).then((data) => {
  console.log('API called successfully. Returned data: ' + data);
}, (error) => {
  console.error(error);
});

```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| Id of the user | 
 **count** | **Number**| Maximum number of personalized documents to return | [optional] [default to 10]

### Return type

[**PersonalizedDocumentsResponse**](PersonalizedDocumentsResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

