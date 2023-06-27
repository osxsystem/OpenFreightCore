import XCTest
@testable import OpenFreightCore

final class OpenFreightCoreTests: XCTestCase {
 
  
  func testColorRedEqual() {
    let color = OpenFreightCore.colorFromHex("FF0000")
    XCTAssertEqual(color, .red)
  }
  
  static var allTests = [
    ( "testColorRedEqual", testColorRedEqual )
  ]
}
