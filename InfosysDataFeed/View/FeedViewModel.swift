//
//  FeedViewModel.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 9/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import UIKit
/*
 The FeedViewModel to make network calls to any
 external API to display the feeds
 */
class FeedViewModel {
   
    var rowsPerSection: [Int:[Feed]] = [Int: [Feed]]()
    var hostVC:FeedViewController?
    var data = [Feed]() {
        didSet {
            rowsPerSection[0] =  data
        }
    }
    
    let feed = APIFactory.getFeedsAPI(apiType: .FACT)
    
    init(parentController: FeedViewController) {
        //initialisaing this here, so we don't need to check
        //for optionals in  number of rows calculation
        rowsPerSection[0] = [Feed]()
        self.hostVC = parentController
    }
    func numberOfRows(in section: Int) -> Int {
        var totalSections = 0
        if let row = rowsPerSection[section] {
            totalSections =  row.count
        }
        return totalSections
    }
    func getFactsData(from extUrl: String) {
        feed.getFeed(url: extUrl) { (facts: [Feed]?, err: Error?)  in
            if err != nil {
                print("Error occured, cannot find Feed")
                //show an error message
            }
            if let f = facts {
                self.data = f
            }
        }
    }
}
