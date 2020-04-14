//
//  APITest.swift
//  InfosysDataFeedTests
//
//  Created by Bhuman Soni on 14/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import XCTest

class APITest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
    }
    func testFactoryDefault() {
        let retrievedAPI = APIFactory.getFeedsAPI()
        XCTAssert(type(of: retrievedAPI) == FactsAPI.self , "By default we expect the API factory to return Facts API")
    }
    func testDefaultURL() {
        let urlStr = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        XCTAssert(CONSTANTS.DEFAULT_FACTS_URL.compare(urlStr) == .orderedSame, "We expect the Default url to be of the facts.json in drop box")
    }
    func testFactAPIWorking() {
        let factsApi = APIFactory.getFeedsAPI(apiType: .FACT)
        factsApi.getFeed(urlStr: CONSTANTS.DEFAULT_FACTS_URL) { (feed, error) in
            guard let f = feed else {
                XCTFail()
                return
            }
            XCTAssertNotNil(f.title, "We expect the feed to have a title")
        }
    }
    func testFactFeedHasItems() {
        let factsApi = APIFactory.getFeedsAPI(apiType: .FACT)
        factsApi.getFeed(urlStr: CONSTANTS.DEFAULT_FACTS_URL) { (feed, error) in
            guard let f = feed,
                let rows = f.rows else {
                XCTFail()
                return
            }
            XCTAssertGreaterThanOrEqual(Int(rows.count), 0)
        }
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
