//
//  FeedVCTest.swift
//  InfosysDataFeedTests
//
//  Created by Bhuman Soni on 14/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import XCTest

class FeedVCTest: XCTestCase {
    
    let vc = FeedViewController()
    override func setUp() {
        vc.loadView()
        vc.viewDidLoad()
        vc.viewDidAppear(true)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //XCTAssertNotNil(vc.navigationItem.title, "The title shouldn't be nil")
        //XCTAssertEqual(vc.navigationItem.title!, "About Canada")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
