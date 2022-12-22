# Getting started

## Setting up the SDK

Our SDK includes a test code page, which simply invokes each existing method. Method invocation examples can always be copied from there.

This SDK has been generated via OpenAPI. The original spec files can be found in our [open source git repository](https://github.com/xaynetwork/xayn_discovery_engine/tree/main/web-api/openapi).
If preferred, you can also generate the SDK yourself using the tooling provided by [OpenAPI](https://www.openapis.org/).

The following code snippet initializes the API using 2 parameters:
- A `base_url`, which acts as the endpoint for API calls
- An authorization token

```javascript
let base_url = $URL
let authorizationToken = $TOKEN

// create a client with the base_url
let client = new XaynBackOfficeSdk.ApiClient(base_url);

// pass the token to the client
let api_key = client.authentications["ApiKeyAuth"];
api_key.apiKey = authorizationToken;

// finally, initialize the api with the client
let api = new XaynBackOfficeSdk.BackOfficeApi(client);
```

## Creating documents

You can, submit multiple documents at once, with an upper limit of 100 documents per call.
If you need to create more documents, then split up your document list into batches of 100 each and then call this method sequentially.

Should one or more documents from a batch fail to be created, then the response will list these documents.

If you pass a document which _was already created in the past_, then you simply overwrite the old document with the newly provided one. This can only happen if we find the exact same document ID already in our system.

```javascript
api.createDocuments({
    // maximum 100 documents at a time!
    documents: [
        {
            id: "document_A",
            snippet: "one paragraph about document A",
            properties: {
                image_url: "https://...",
                link_url: "https://...",
                date_published: "...",
                author: "...",
            },
        },
        {
            id: "document_B",
            snippet: "one paragraph about document B",
            properties: {
                image_url: "https://...",
                link_url: "https://...",
                date_published: "...",
                author: "...",
            },
        },
    ],
}).then((result) => {
    console.log("done!)
}).catch((error) => {
    console.log(error)
})
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