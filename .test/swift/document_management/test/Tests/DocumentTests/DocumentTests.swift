import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import OpenAPIClient


enum TestError: Error {
    case runtimeError(String)
}

class UserTest: XCTestCase {
    let testTimeout = 4.0
    let endpoint : String? = ProcessInfo.processInfo.environment["ENDPOINT"]
    let token  : String? = ProcessInfo.processInfo.environment["AUTH_TOKEN"]
    
    
    struct DateTest: Codable {
        let date: Date
    }
    
    override func setUp() {
        super.setUp()
        assert(endpoint != nil, "Missing ENDPOINT in env")
        assert(token != nil, "Missing AUTH_TOKEN in env")
        
        OpenAPIClientAPI.basePath = endpoint!
        OpenAPIClientAPI.customHeaders["authorizationToken"] = token!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testA_DocumentIngestion() {
        let expectation = self.expectation(description: "Test: Should call ingestDocuments successfully")
        let request = IngestionRequest(documents: [
            IngestedDocument(id: "test_A", snippet: "test A", properties: [  "category": "test"]),
            IngestedDocument(id: "test_B", snippet: "test B", properties: [  "category": "test"]),
            IngestedDocument(id: "test_C", snippet: "test C", properties: [  "category": "test"]),
            IngestedDocument(id: "test_D", snippet: "test D", properties: [  "category": "test"])
        ])
        
        DocumentsAPI.ingestDocuments(ingestionRequest: request){ response, error in
            guard error == nil else {
                printError(error)
                
                return
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
    
    
    func testB_DocumentDeletion() {
        let expectation = self.expectation(description: "Test: Should call deleteDocument successfully")
        
        DocumentsAPI.deleteDocument(documentId: "test_D" ) { response, error in
            guard error == nil else {
                printError(error)
                
                return
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
    
    func testC_DocumentPropertiesDeletion() {
        let expectation = self.expectation(description: "Test: Should call deleteDocumentProperties successfully")
        
        DocumentsAPI.deleteDocumentProperties(documentId: "test_A" ) { response, error in
            guard error == nil else {
                printError(error)
                
                return
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
    
    func testD_DocumentPropertyDeletion() {
        let expectation = self.expectation(description: "Test: Should call delete DocuementProperty successfully")
        
        DocumentsAPI.deleteDocumentProperty(documentId: "test_A", propertyId: "category") { response, error in
            guard error == nil else {
                printError(error)
                
                return
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
    
    
    func testE_DocumentsDeletion() {
        let expectation = self.expectation(description: "Test: Should call deleteDocuments successfully")
        let request = DeleteDocumentsRequest(documents: ["test_A", "test_B"])
        
        DocumentsAPI.deleteDocuments(deleteDocumentsRequest: request) { response, error in
            guard error == nil else {
                printError(error)
                
                return
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
    
}

func printError(_ error: Error?) {
    switch error! {
    case let ErrorResponse.error(code, data, _, _):
        print("Code: \(code)")
        switch data {
        case .none: break
        case let .some(d): print(String(decoding: d, as: UTF8.self))
        }
    default: print(error!)
    }
}
