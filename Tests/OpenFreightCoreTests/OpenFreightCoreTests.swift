import XCTest
@testable import OpenFreightCore

final class OpenFreightCoreTests: XCTestCase {
 
  
  func testColorRedEqual() {
    let color = OpenFreightCore.colorFromHex("FF0000")
    XCTAssertEqual(color, .red)
  }
  
  func testOpenFreightColorAreEqual() {
    let color = OpenFreightCore.colorFromHex("006736")
    XCTAssertEqual(color, OpenFreightCore.freightColor)
  }
  
  static var allTests = [
    ( "testColorRedEqual", testColorRedEqual ),
    ( "testOpenFreightColorAreEqual", testOpenFreightColorAreEqual )
  ]
}
