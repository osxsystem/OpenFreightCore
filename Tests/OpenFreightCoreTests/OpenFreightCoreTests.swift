import XCTest
@testable import OpenFreightCore

final class OpenFreightCoreTests: XCTestCase {
 
  
  func testColorRedEqual() {
    let color = OpenFreightCore.Color.fromHex("FF0000")
    XCTAssertEqual(color, .red)
  }
  
  func testOpenFreightColorAreEqual() {
    let color = OpenFreightCore.Color.fromHex("006736")
    XCTAssertEqual(color, OpenFreightCore.Color.freightColor)
  }
  
  static var allTests = [
    ( "testColorRedEqual", testColorRedEqual ),
    ( "testOpenFreightColorAreEqual", testOpenFreightColorAreEqual )
  ]
}
