//
//  OpenFreightNetworkingTest.swift
//  
//
//  Created by Hung Viet Do on 7/17/23.
//

import XCTest
import OpenFreightCore

final class OpenFreightNetworkingTest: XCTestCase {
  
  func testLoadDataCall() {
    let manager = OpenFreightCore.Networking.Manager()
    let expectation = XCTestExpectation(description: "Called Networking for data")
    guard let url = URL(string: "https://raywenderlich.com") else {
      return XCTFail("Error! Could not create URL properly")
    }
    
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
