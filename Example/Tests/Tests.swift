import XCTest
import FindMyIP

class Tests: XCTestCase {
    
    private var mockVM: MockIPViewModel?
    private var mockFetchable: MockDetailsFetchable?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func givenModel() {
        mockFetchable = MockDetailsFetchable()
        XCTAssertNotNil(mockFetchable)
    }
    
    func whenMockDataGiven()  {
        mockVM =  MockIPViewModel(ipDetailsFetcher: mockFetchable!, ipInfo: mockFetchable?.mockModel(filename:"IPDetails"))
        XCTAssertNotNil(mockVM)
    }
    
    func thenSuccessResult()  {
        let model =  mockFetchable?.mockModel(filename: "IPDetails")
        XCTAssertNotNil(model)
    }
    
    func whenMockDataNotGiven() {
        mockVM = MockIPViewModel(ipDetailsFetcher: mockFetchable!, ipInfo: nil)
        XCTAssertNotNil(mockVM)
    }
    
    func thenFaildResult()  {
        let model =  mockFetchable?.mockModel(filename: nil)
        XCTAssertNil(model)
    }
    
    func testIPDataModelSuccess()  {
        givenModel()
        whenMockDataGiven()
        thenSuccessResult()
    }
    
    func testIPDataModelFailure()  {
        givenModel()
        whenMockDataNotGiven()
        thenFaildResult()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
