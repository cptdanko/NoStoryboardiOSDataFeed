//
//  FeedAPI.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 9/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

class FactsAPI: FeedAPI  {
    
    
    func getFeed(url: String, completionHandler: @escaping ([Feed]?, Error?) -> ()) {
        completionHandler(MockData.factFeed(), nil)
    }
}
