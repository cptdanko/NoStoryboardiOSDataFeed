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
    /*
     Structured the code to show a 2-D grid of feed items
     to represeant an array of Feed objects. Each feed
     has a title as well as items in it. Example fact feed
     we can have Fact and Fiction feed together.
     FeedTitle: Array of feeditems | row = 0.title="Fact" -> items
     row = 1.title="Fiction" -> items
     var feedArray: [Int:Array<FeedItem>] = [Int: Array<FeedItem>]()
     */
    var feedArray: [Int:Array<FeedItem>] = [Int: Array<FeedItem>]()
    var factFeed = Feed() {
        didSet {
            if let rowData = factFeed.rows {
                feedArray[0] = rowData
            }
        }
    }
    
    let feed = APIFactory.getFeedsAPI(apiType: .FACT)
    var hostVC:FeedViewController?
    init(parentController: FeedViewController) {
        //initialisaing this here, so we don't need to check
        //for optionals in  number of rows calculation
        feedArray[0] = [FeedItem]()
        self.hostVC = parentController
    }
    func numberOfRows(in section: Int) -> Int {
        var totalSections = 0
        if let row = feedArray[section] {
            totalSections =  row.count
        }
        return totalSections
    }
    @objc func refreshFeed() {
        print("view model refresh feed")
        getFactsData(from: CONSTANTS.DEFAULT_FACTS_URL)
    }
    func getFactsData(from extUrl: String) {
        feed.getFeed(url: extUrl) { (facts: Feed?, err: Error?)  in
            if err != nil {
                print("Error occured, cannot find Feed")
                //show an error message
            }
            if let f = facts {
                self.factFeed = f
                self.hostVC?.reloadData()
                self.hostVC?.updateNavigation(title: f.title)
            }
        }
    }
}
