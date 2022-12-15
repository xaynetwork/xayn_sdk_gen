/*
 * Personalization API For Document Management
 * # Documents management For this system, a document is anything that has an id, a snippet, and an arbitrary set of properties. The id uniquely identifies the document in the system. The system uses the snippet to create a document representation that can be matched against user interests.  It is possible to attach any properties to a document; the system will not use them but will be returned together with the document when asking for personalized documents for a user. They could help store information like a title and the URL where it is possible to find the document. Each document can have its own set of properties.  The API offers an endpoint that allows uploading the documents to the system. After a successful upload, it will be possible to use the document in other endpoints.  # Auth To authenticate with the API, a token will be provided.
 *
 * The version of the OpenAPI document: 1.0.0-rc5
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

package com.xayn.documents;

import com.xayn.documents.models.DeleteDocumentsRequest;
import com.xayn.documents.models.DocumentPropertiesRequest;
import com.xayn.documents.models.DocumentPropertiesResponse;
import com.xayn.documents.models.DocumentPropertyRequest;
import com.xayn.documents.models.DocumentPropertyResponse;
import com.xayn.documents.models.IngestedDocument;
import com.xayn.documents.models.IngestionRequest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * API tests for DocumentsApi
 */
public class DocumentsApiTest {

    private final DocumentsApi api = new DocumentsApi(new ApiClient());

    public DocumentsApiTest() {
        String endpoint = System.getProperty("endpoint");
        String token = System.getProperty("token");

        api.getApiClient().setBasePath(endpoint).setApiKey(token);
    }

    /**
     * Add documents to the system
     *
     * Add documents to the system. The system will create a representation of the
     * document that will be used to match it against the preferences of a user.
     *
     * @throws ApiException if the Api call fails
     */
    @BeforeEach
    public void ingestDocumentsTest() throws ApiException {
        List<IngestedDocument> documents = new ArrayList<IngestedDocument>();
        Map<String, Object> properties = new HashMap<String, Object>();

        properties.put("category", "test");
        documents.add(new IngestedDocument().id("test_A").snippet("test A").properties(properties));
        documents.add(new IngestedDocument().id("test_B").snippet("test B").properties(properties));
        documents.add(new IngestedDocument().id("test_C").snippet("test C").properties(properties));
        documents.add(new IngestedDocument().id("test_D").snippet("test D").properties(properties));

        IngestionRequest ingestionRequest = new IngestionRequest().documents(documents);

        api.ingestDocuments(ingestionRequest);
    }

    /**
     * Delete the document from the system.
     *
     * Permanently deletes the document from the system. The endpoint is idempotent.
     * Deleting a non-existing document does not produce an error.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void deleteDocumentTest() throws ApiException {
        api.deleteDocument("test_D");
    }

    /**
     * Delete all document properties
     *
     * Deletes all the properties of the document.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void deleteDocumentPropertiesTest() throws ApiException {
        api.deleteDocumentProperties("test_C");
    }

    /**
     * Delete a document property
     *
     * Deletes the property of the document.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void deleteDocumentPropertyTest() throws ApiException {
        api.deleteDocumentProperty("test_B", "category");
    }

    /**
     * Delete all listed documents.
     *
     * Delete all documents listed in the request body. The endpoint is idempotent.
     * I.e. if the list contains one or multiple non-existing documents, no error is
     * produced.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void deleteDocumentsTest() throws ApiException {
        List<String> documents = new ArrayList<String>();
        DeleteDocumentsRequest deleteDocumentsRequest = new DeleteDocumentsRequest();
        documents.add("test_B");
        documents.add("test_C");
        deleteDocumentsRequest.setDocuments(documents);

        api.deleteDocuments(deleteDocumentsRequest);
    }

    /**
     * Get all document properties
     *
     * Gets all the properties of the document.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void getDocumentPropertiesTest() throws ApiException {
        DocumentPropertiesResponse response = api.getDocumentProperties("test_A");
        assertEquals(response.getProperties().get("category"), "test");
    }

    /**
     * Get a document property
     *
     * Gets the property of the document.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void getDocumentPropertyTest() throws ApiException {
        DocumentPropertyResponse response = api.getDocumentProperty("test_A", "category");
        assertEquals(response.getProperty(), "test");
    }

    /**
     * Set all document properties
     *
     * Sets or replaces all the properties of the document.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void setDocumentPropertiesTest() throws ApiException {
        DocumentPropertiesRequest documentPropertiesRequest = new DocumentPropertiesRequest();
        documentPropertiesRequest.putPropertiesItem("category", "test changed A");

        api.setDocumentProperties("test_A", documentPropertiesRequest);
    }

    /**
     * Set a document property
     *
     * Sets or replaces the property of the document.
     *
     * @throws ApiException if the Api call fails
     */
    @Test
    public void setDocumentPropertyTest() throws ApiException {
        DocumentPropertyRequest documentPropertyRequest = new DocumentPropertyRequest();
        documentPropertyRequest.setProperty("test changed B");

        api.setDocumentProperty("test_A", "category", documentPropertyRequest);
    }

}
