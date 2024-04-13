import XCTest
@testable import QuizletNetworkLayer

final class QuizletNetworkLayerTests: XCTestCase {
    func testExample() throws {
        assert(BaseNetworkService.shared.testReadFile() != nil)
    }
}
