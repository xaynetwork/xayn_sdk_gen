/*
 * Personalization API For User Management
 * # User management The system identifies a user with only an id. There are two main endpoints: one that allows registering an interaction between a user and a document (a user clicked or liked a document), and one to retrieve a personalized set of documents for the user. The system needs a few user interactions with documents before it can generate a personalized list.  # Auth To authenticate with the API, a token will be provided.
 *
 * The version of the OpenAPI document: 1.0.0-rc5
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

package com.xayn.users;

import com.xayn.users.models.UserInteractionData;
import com.xayn.users.models.UserInteractionRequest;
import com.xayn.users.models.UserInteractionType;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;

/**
 * API tests for UsersApi
 */
public class UsersApiTest {

    private final UsersApi api = new UsersApi(new ApiClient());

    public UsersApiTest() {
        String endpoint = System.getProperty("endpoint");
        String token = System.getProperty("token");

        api.getApiClient().setBasePath(endpoint).setApiKey(token);
    }

    /**
     * Add interaction between a user and a document
     *
     * The interaction is used to provide personalized documents to the user.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void documentInteractionTest() throws ApiException {
        UserInteractionRequest userInteractionRequest = new UserInteractionRequest();
        List<UserInteractionData> documents = new ArrayList<UserInteractionData>();

        documents.add(new UserInteractionData().id("test_A").type(UserInteractionType.POSITIVE));
        documents.add(new UserInteractionData().id("test_B").type(UserInteractionType.POSITIVE));
        
        userInteractionRequest.setDocuments(documents);

        api.documentInteraction("xayn_test_user", userInteractionRequest);
    }

    /**
     * Get personalized documents for the user
     *
     * Returns a list of documents personalized for the given &#x60;user_id&#x60;.
     * Each document contains the id, the score and the properties that are attached
     * to the document. The score is a value between 0 and 1 where a higher value
     * means that the document matches the preferences of the user better.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void getPersonalizedDocumentsTest() throws ApiException {
        try {
            api.getPersonalizedDocuments("new_xayn_test_user", 10);
        } catch (ApiException exception) {
            assertTrue(exception.getResponseBody().contains("NotEnoughInteractions"));
        }
    }
}
