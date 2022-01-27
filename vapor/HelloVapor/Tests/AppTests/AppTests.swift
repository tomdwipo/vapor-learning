@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    var app: Application!
  
    override func setUp() {
        super.setUp()
        app = Application(.testing)
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
 
    func test_get_hi_shouldReturnHelloWorld() throws {
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "hi", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
    
    func test_get_test_vapor_shouldReturnHellopVapor() throws {
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "test/vapor", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello Vapor!")
        })
    }
    
    func test_get_hello_tommy_shouldReturnHelloTommy() throws {
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "hello/tommy", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, tommy!")
        })
    }
    
    func test_get_hello_shouldReturnStatusNotFound() throws {
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "hello/", afterResponse: { res in
            XCTAssertEqual(res.status, .notFound)
        })
    }
    
    
}
