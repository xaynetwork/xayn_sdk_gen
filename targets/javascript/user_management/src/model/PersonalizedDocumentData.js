/**
 * Personalization API For User Management
 * # User management The system identifies a user with only an id. There are two main endpoints: one that allows registering an interaction between a user and a document (a user clicked or liked a document), and one to retrieve a personalized set of documents for the user. The system needs a few user interactions with documents before it can generate a personalized list.  # Auth To authenticate with the API, a token will be provided.
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
 * The PersonalizedDocumentData model module.
 * @module model/PersonalizedDocumentData
 * @version 0.0.1
 */
class PersonalizedDocumentData {
    /**
     * Constructs a new <code>PersonalizedDocumentData</code>.
     * @alias module:model/PersonalizedDocumentData
     * @param id {String} A document id can be any non-empty UTF-8 string that does not contain the null byte. It may consist of digits, Latin letters, underscores, colons, minus signs, at signs, and dots.
     * @param score {Number} 
     */
    constructor(id, score) { 
        
        PersonalizedDocumentData.initialize(this, id, score);
    }

    /**
     * Initializes the fields of this object.
     * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
     * Only for internal use.
     */
    static initialize(obj, id, score) { 
        obj['id'] = id;
        obj['score'] = score;
    }

    /**
     * Constructs a <code>PersonalizedDocumentData</code> from a plain JavaScript object, optionally creating a new instance.
     * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
     * @param {Object} data The plain JavaScript object bearing properties of interest.
     * @param {module:model/PersonalizedDocumentData} obj Optional instance to populate.
     * @return {module:model/PersonalizedDocumentData} The populated <code>PersonalizedDocumentData</code> instance.
     */
    static constructFromObject(data, obj) {
        if (data) {
            obj = obj || new PersonalizedDocumentData();

            if (data.hasOwnProperty('id')) {
                obj['id'] = ApiClient.convertToType(data['id'], 'String');
            }
            if (data.hasOwnProperty('score')) {
                obj['score'] = ApiClient.convertToType(data['score'], 'Number');
            }
            if (data.hasOwnProperty('properties')) {
                obj['properties'] = ApiClient.convertToType(data['properties'], {'String': Object});
            }
        }
        return obj;
    }

    /**
     * Validates the JSON data with respect to <code>PersonalizedDocumentData</code>.
     * @param {Object} data The plain JavaScript object bearing properties of interest.
     * @return {boolean} to indicate whether the JSON data is valid with respect to <code>PersonalizedDocumentData</code>.
     */
    static validateJSON(data) {
        // check to make sure all required properties are present in the JSON string
        for (const property of PersonalizedDocumentData.RequiredProperties) {
            if (!data[property]) {
                throw new Error("The required field `" + property + "` is not found in the JSON data: " + JSON.stringify(data));
            }
        }
        // ensure the json data is a string
        if (data['id'] && !(typeof data['id'] === 'string' || data['id'] instanceof String)) {
            throw new Error("Expected the field `id` to be a primitive type in the JSON string but got " + data['id']);
        }

        return true;
    }


}

PersonalizedDocumentData.RequiredProperties = ["id", "score"];

/**
 * A document id can be any non-empty UTF-8 string that does not contain the null byte. It may consist of digits, Latin letters, underscores, colons, minus signs, at signs, and dots.
 * @member {String} id
 */
PersonalizedDocumentData.prototype['id'] = undefined;

/**
 * @member {Number} score
 */
PersonalizedDocumentData.prototype['score'] = undefined;

/**
 * Arbitrary properties that can be attached to a document. A key must be a valid `DocumentPropertyId`.
 * @member {Object.<String, Object>} properties
 */
PersonalizedDocumentData.prototype['properties'] = undefined;






export default PersonalizedDocumentData;

