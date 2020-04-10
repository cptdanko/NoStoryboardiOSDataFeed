//
//  APIFactory.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 10/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

enum FEED_API {
    case FACT
}

import Foundation
class APIFactory {
    
    public let shared = APIFactory()
    
    static func getFeedsAPI(apiType: FEED_API) -> FeedAPI {
        var defaultAPI: FeedAPI = FactsAPI()
        switch apiType {
            case .FACT:
                defaultAPI = FactsAPI()
            break
        }
        return defaultAPI
    }
}
