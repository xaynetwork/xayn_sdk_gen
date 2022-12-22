# Getting started

## Prerequisities

Before using this library, ensure that you have submitted a reasonably large amount of documents via our other SDK, the back office.

Any usage of this SDK depends on the above requirement, without it, none of the functionality that this SDK provides will be of use.

## Setting up the SDK

Our SDK includes a test code page, which simply invokes each existing method. Method invocation examples can always be copied from there.

This SDK has been generated via OpenAPI. The original spec files can be found in our [open source git repository](https://github.com/xaynetwork/xayn_discovery_engine/tree/main/web-api/openapi).
If preferred, you can also generate the SDK yourself using the tooling provided by [OpenAPI](https://www.openapis.org/).

The following code snippet initializes the API using 2 parameters:
- A `base_url`, which acts as the endpoint for API calls
- An authorization token

```java
FrontOfficeApi api = new FrontOfficeApi(new ApiClient());

api.getApiClient().setBasePath($URL).setApiKey($TOKEN);
```

## Interacting with documents

Next, we will create an interaction for a document. We currently support only a positive interaction, or a "like".

The following paramers are required:
- A valid document ID, matching any ID which exists in the system
- A user ID

As explained above, a user is nothing more than a unique `String` under which we accumulate document interactions.

The user does not need to be created seperately, if we receive an "unknown" user via an interaction, then we simply create that user on our side. The user then exists from this point and can recurringly be used in the future.

The next example is a simple document interaction:

```java
UserInteractionRequest userInteractionRequest = new UserInteractionRequest();
List<UserInteractionData> documents = new ArrayList<UserInteractionData>();

documents
    .add(new UserInteractionData()
    .id("document_A")
    .type(UserInteractionType.POSITIVE));

userInteractionRequest.setDocuments(documents);

api.updateUserInteractions($USER, userInteractionRequest);
```

## Obtaining user recommendations

If you have performed at least _one_ interaction for a given `user_id`, as portrayed in the above example, then you can also use the next example to fetch recommendations.

The count parameter is optional, it defaults to 10 if not specified.

```java
api.getPersonalizedDocuments($USER, 10);
```