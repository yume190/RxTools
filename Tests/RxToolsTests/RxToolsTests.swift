import XCTest
@testable import RxTools

final class RxToolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RxTools().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
