//
//  Feed.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 12/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

/*
 Our model to store our feed in this case
 it's Fact Feed
 */
class Feed: Decodable {
    var title: String?
    var rows: [FeedItem]?
}
