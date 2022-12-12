/**
 * Personalization API For Document Management
 * # Documents management For this system, a document is anything that has an id, a snippet, and an arbitrary set of properties. The id uniquely identifies the document in the system. The system uses the snippet to create a document representation that can be matched against user interests.  It is possible to attach any properties to a document; the system will not use them but will be returned together with the document when asking for personalized documents for a user. They could help store information like a title and the URL where it is possible to find the document. Each document can have its own set of properties.  The API offers an endpoint that allows uploading the documents to the system. After a successful upload, it will be possible to use the document in other endpoints.  # Auth To authenticate with the API, a token will be provided.
 *
 * The version of the OpenAPI document: 1.0.0-rc5
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 *
 */

import ApiClient from '../ApiClient';

/**
 * The DocumentPropertyRequest model module.
 * @module model/DocumentPropertyRequest
 * @version 0.0.1
 */
class DocumentPropertyRequest {
    /**
     * Constructs a new <code>DocumentPropertyRequest</code>.
     * @alias module:model/DocumentPropertyRequest
     * @param property {Object} Arbitrary property that can be attached to a document.
     */
    constructor(property) { 
        
        DocumentPropertyRequest.initialize(this, property);
    }

    /**
     * Initializes the fields of this object.
     * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
     * Only for internal use.
     */
    static initialize(obj, property) { 
        obj['property'] = property;
    }

    /**
     * Constructs a <code>DocumentPropertyRequest</code> from a plain JavaScript object, optionally creating a new instance.
     * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
     * @param {Object} data The plain JavaScript object bearing properties of interest.
     * @param {module:model/DocumentPropertyRequest} obj Optional instance to populate.
     * @return {module:model/DocumentPropertyRequest} The populated <code>DocumentPropertyRequest</code> instance.
     */
    static constructFromObject(data, obj) {
        if (data) {
            obj = obj || new DocumentPropertyRequest();

            if (data.hasOwnProperty('property')) {
                obj['property'] = ApiClient.convertToType(data['property'], Object);
            }
        }
        return obj;
    }

    /**
     * Validates the JSON data with respect to <code>DocumentPropertyRequest</code>.
     * @param {Object} data The plain JavaScript object bearing properties of interest.
     * @return {boolean} to indicate whether the JSON data is valid with respect to <code>DocumentPropertyRequest</code>.
     */
    static validateJSON(data) {
        // check to make sure all required properties are present in the JSON string
        for (const property of DocumentPropertyRequest.RequiredProperties) {
            if (!data[property]) {
                throw new Error("The required field `" + property + "` is not found in the JSON data: " + JSON.stringify(data));
            }
        }

        return true;
    }


}

DocumentPropertyRequest.RequiredProperties = ["property"];

/**
 * Arbitrary property that can be attached to a document.
 * @member {Object} property
 */
DocumentPropertyRequest.prototype['property'] = undefined;






export default DocumentPropertyRequest;
