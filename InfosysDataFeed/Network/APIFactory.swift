//
//  APIFactory.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 10/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

enum FEED_API {
    case FACT
    case FICTION //in case we do have it
}

import Foundation

class APIFactory {
    
    public let shared = APIFactory()
    /*
     A function which returns a FEED_API and defaults
     to returning the FACT API
     */
    static func getFeedsAPI(apiType: FEED_API = FEED_API.FACT) -> FeedAPI {
        var defaultAPI: FeedAPI = FactsAPI()
        switch apiType {
            case .FACT:
                defaultAPI = FactsAPI()
                break
            case .FICTION:
                //for when we do have a fiction API
                break
        }
        return defaultAPI
    }
}
