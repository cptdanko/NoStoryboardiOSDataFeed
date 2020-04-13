//
//  FeedAPI.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 9/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

/*
 An implementation of the FeedAPI protocol that just
 handles the fetching and the parsing of the FactsAPI
 */
class FactsAPI: FeedAPI  {
    
    func getFeed(url: String, completionHandler: @escaping (Feed?, Error?) -> ()) {
            
        if let data = FileIO.readJSONData(from: "facts") {
            Parser.shared.parse(data: data, type: Feed.self) { (feed, error) in
                if error != nil {
                    completionHandler(nil, error)
                }
                completionHandler(feed, nil)
            }
        }
    }
}
