//
//  FeedModelTests.swift
//  InfosysDataFeedTests
//
//  Created by Bhuman Soni on 14/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import XCTest

class FeedModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNilPropertyFeed() {
        let nilFeed = Feed()
        XCTAssertNil(nilFeed.rows, "A feed can be empty and have no items")
        XCTAssertNil(nilFeed.title,"A feed can have no title")
    }
    func testSinglePropertyFeed() {
        let feed = Feed()
        feed.title = "About Canada"
        XCTAssertEqual(feed.title, "About Canada", "Feed title can be edited and set the feed title")
        
        let f2 = Feed()
        f2.rows = [FeedItem]()
        XCTAssertNotNil(f2.rows, "Feed rows can be edited and set")
    }
    func testNilFeedItem() {
        let f1 = FeedItem(title: nil, description: nil, imageHref: nil)
        XCTAssertNotNil(f1, "We can create a FeedItem without a title, description and imageHref")
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
