//
//  DesignPatternsTests.swift
//  DesignPatternsTests
//
//  Created by Lia Kassardjian on 10/08/21.
//

import XCTest
import Singleton

class DesignPatternsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConcurrentUsage() {
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        let expectation = expectation(description: "Using UserSettings.shared from multiple threads shall succeed")
        
        let callCount = 100
        for callIndex in 1...callCount {
            concurrentQueue.async {
                UserSettings.shared.set(value: callIndex, forKey: String(callIndex))
            }
        }
        
        while UserSettings.shared.int(forKey: String(callCount)) != callCount {}
        expectation.fulfill()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Test expectation failed")
        }
    }

}
