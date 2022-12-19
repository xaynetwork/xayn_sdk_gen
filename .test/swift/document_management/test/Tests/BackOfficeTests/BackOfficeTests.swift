import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import OpenAPIClient


enum TestError: Error {
    case runtimeError(String)
}

class BackOfficeTests: XCTestCase {
    let testTimeout = 4.0
    let endpoint : String? = ProcessInfo.processInfo.environment["ENDPOINT"]
    let token  : String? = ProcessInfo.processInfo.environment["TOKEN_DOCUMENTS"]
    
    
    struct DateTest: Codable {
        let date: Date
    }
    
    override func setUp() {
        super.setUp()
        assert(endpoint != nil, "Missing ENDPOINT in env")
        assert(token != nil, "Missing TOKEN_DOCUMENTS in env")
        
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
            IngestedDocument(id: "test_A", snippet: "The story serves as a companion piece to Renoir's 1937 film, Grand Illusion, once more bringing together men from across the broad social spectrum of French society to depict one man's Sisyphean efforts to escape captivity in a German POW camp.", properties: [  "category": "test"]),
            IngestedDocument(id: "test_B", snippet: "The tragic story of a young orphan girl who is befriended by an innocent but emotionally disabled veteran of the French Indochina War.", properties: [  "category": "test"]),
            IngestedDocument(id: "test_C", snippet: "A fiercely independent cowboy arranges to have himself locked up in jail in order to then escape with an old friend who has been sentenced to the penitentiary.", properties: [  "category": "test"]),
            IngestedDocument(id: "test_D", snippet: "Documents the lives of infamous fakers Elmyr de Hory and Clifford Irving. De Hory, who later committed suicide to avoid more prison time, made his name by selling forged works of art by painters like Picasso and Matisse. Irving was infamous for writing a fake autobiography of Howard Hughes. Welles moves between documentary and fiction as he examines the fundamental elements of fraud and the people who commit fraud at the expense of others.", properties: [  "category": "test"])
        ])
        
        BackOfficeAPI.ingestDocuments(ingestionRequest: request){ response, error in
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
        
        BackOfficeAPI.deleteDocument(documentId: "test_D" ) { response, error in
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
        
        BackOfficeAPI.deleteDocumentProperties(documentId: "test_A" ) { response, error in
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
        
        BackOfficeAPI.deleteDocumentProperty(documentId: "test_A", propertyId: "category") { response, error in
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
        
        BackOfficeAPI.deleteDocuments(deleteDocumentsRequest: request) { response, error in
            guard error == nil else {
                printError(error)
                
                return
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }


    func testF_DocumentReingestion() {
        testA_DocumentIngestion();
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
