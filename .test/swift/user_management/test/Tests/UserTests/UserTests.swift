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
    let token  : String? = ProcessInfo.processInfo.environment["TOKEN_USERS"]
    
    
    struct DateTest: Codable {
        let date: Date
    }
    
    override func setUp() {
        super.setUp()
        assert(endpoint != nil, "Missing ENDPOINT in env")
        assert(token != nil, "Missing TOKEN_USERS in env")
        
        OpenAPIClientAPI.basePath = endpoint!
        OpenAPIClientAPI.customHeaders["authorizationToken"] = token!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testA_UsersInteraction() {
        print("Calling /users/{user_id}/interaction ...")
        
        let expectation = self.expectation(description: "Test: User Interaction")
        let userId = "simon" // String | Id of the userÏ
        let interaction = UserInteractionRequest(documents:
                                                    [UserInteractionData(id: "test_A", type: UserInteractionType.positive), UserInteractionData(id: "test_B", type: UserInteractionType.positive)]
        )
        
        UsersAPI.documentInteraction(userId: userId, userInteractionRequest: interaction) { response, error in
            guard error == nil else {
                printError(error)
                
                return
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: testTimeout, handler: nil)
    }
    
  
    func testB_UsersGetPersonalizedDocuments() {
        print("Calling /users/{user_id}/personalized_documents ...")
        
        let expectation = self.expectation(description: "Test: User getPersonalizedDocuments")
        let userId = "simon" // String | Id of the
        
        UsersAPI.getPersonalizedDocuments(userId: userId) { response, error in
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
