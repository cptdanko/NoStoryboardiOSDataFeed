//
//  FeedAPI.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 10/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

protocol FeedAPI {
    func getFeed(urlStr: String, completionHandler: @escaping (_ data: Feed?, _ err: ErrorResultType?) -> ())
}
