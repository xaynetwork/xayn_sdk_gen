# Getting started

## Setting up the SDK

Our SDK includes a test code page, which simply invokes each existing method. Method invocation examples can always be copied from there.

This SDK has been generated via OpenAPI. The original spec files can be found in our [open source git repository](https://github.com/xaynetwork/xayn_discovery_engine/tree/main/web-api/openapi).
If preferred, you can also generate the SDK yourself using the tooling provided by [OpenAPI](https://www.openapis.org/).

The following code snippet initializes the API using 2 parameters:
- A `base_url`, which acts as the endpoint for API calls
- An authorization token

```swift
let base_url = $URL
let authorizationToken = $TOKEN

XaynBackOfficeSdk.basePath = base_url
XaynBackOfficeSdk.customHeaders["authorizationToken"] = authorizationToken
```

## Creating documents

You can, submit multiple documents at once, with an upper limit of 100 documents per call.
If you need to create more documents, then split up your document list into batches of 100 each and then call this method sequentially.

Should one or more documents from a batch fail to be created, then the response will list these documents.

If you pass a document which _was already created in the past_, then you simply overwrite the old document with the newly provided one. This can only happen if we find the exact same document ID already in our system.

```swift 
let request = IngestionRequest(documents: [
    IngestedDocument(
        id: "document_A", 
        snippet: "one paragraph about document A", 
        properties: [
            "imageUrl": "https://...",
            "linkUrl": "https://...",
            "datePublished": "...",
            "author": "...",
        ]),
    IngestedDocument(
        id: "document_B", 
        snippet: "one paragraph about document B", 
        properties: [
            "imageUrl": "https://...",
            "linkUrl": "https://...",
            "datePublished": "...",
            "author": "...",
        ])    
])
        
BackOfficeAPI.createDocuments(ingestionRequest: request){ response, error in
    if let error = error else {
        print("\(error)")
        
        return
    }

    // done!
}
```

## Other operations

After documents have been created, you can continue to manage them in different ways.

Please refer to the test file to see some examples, below is a list of available methods:
- `deleteDocuments`
- `deleteDocument`
- `deleteDocumentProperties`
- `deleteDocumentProperty`
- `listDocumentProperties`
- `getDocumentProperty`
- `replaceDocumentProperties`
- `replaceDocumentProperty`