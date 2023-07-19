//
//  OpenFreightNetworkingTest.swift
//  
//
//  Created by Hung Viet Do on 7/17/23.
//

import XCTest
@testable import OpenFreightCore

class NetworkSessionMock : NetworkSession {
  var data: Data?
  var error: Error?
  func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
    completionHandler(data, error)
  }
  
  
}

final class OpenFreightNetworkingTest: XCTestCase {
  
  func testLoadDataCall() {
    let manager = OpenFreightCore.Networking.Manager()
    let session = NetworkSessionMock()
    manager.session = session
    let expectation = XCTestExpectation(description: "Called Networking for data")
    let data = Data([0, 1, 0, 1])
    session.data = data
    let url = URL.init(fileURLWithPath: "url")
    
    
    manager.loadData(from: url) { result in
      expectation.fulfill()
      switch result {
        case .success(let returnedData):
          XCTAssertNotNil(returnedData, "Response data is nil")
        case .failure(let error):
          XCTFail(error?.localizedDescription ?? "error from result")
      }
    }
    wait(for: [expectation], timeout: 5)
  }
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  static var allTests = [
    ("testLoadDataCall", testLoadDataCall)
  ]
}
