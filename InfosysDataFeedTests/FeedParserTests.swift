//
//  FeedParser.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 14/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import XCTest

class FeedParser: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setting it up")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /*
     We expect the parser to fail, when we don't supply any
     data to it
     */
    func testEmptyData() {
        let data = Data()
        Parser.shared.parse(data: data, type: Feed.self) { (feed, error) in
            XCTAssertTrue(error != nil, "When we supply no arguments, we expect error to not be nil")
        }
    }
    func testValidTitleParse() {
        MockData.feedFromFileReadNParse { (feed, error) in
            XCTAssertNotNil(feed)
            XCTAssertEqual(feed?.title, "About Canada", "Expect the title to be 'About Canada'")
        }
    }
    func testValidParseRows() {
        MockData.getDataFromFile { (data, error) in
            guard let d = data else {
                return
            }
            Parser.shared.parse(data: d, type: Feed.self) { (feed, error) in
                XCTAssertTrue(feed?.rows?.count == 14, "In our facts.json file stored locally, we have 14 feed items")
            }
        }
    }
}
