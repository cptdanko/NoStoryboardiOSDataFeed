//
//  Mock.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 10/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation


class MockData {
    
    /* read a file and return Data */
    static func getDataFromFile(completionHandler: @escaping (_ data: Data?,_ error: Error?) -> ()) {
        guard let data = FileIO.readJSONData(from: "facts") else {
            completionHandler(nil, nil)
            return
        }
        completionHandler(data, nil)
    }
    static func feedFromFileReadNParse(completionHandler: @escaping (Feed?, Error?) -> ()) {
        guard let data = FileIO.readJSONData(from: "facts") else {
            print("Error reading from file")
            return
        }
        Parser.shared.parse(data: data, type: Feed.self) { (feed, error) in
           if error != nil {
               completionHandler(nil, error)
           }
           completionHandler(feed, nil)
        }
    }
    static func dummyData() -> [FeedItem] {

        let f1 = FeedItem(title: "Beavers", description: "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony", imageHref: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
        
        let f2 = FeedItem(title: "Flag", description: nil, imageHref: "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png")
        
        let f3 = FeedItem(title: "Transportation", description: "It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.", imageHref: "http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg")
        
        let f4 = FeedItem(title: "Hockey Night in Canada", description: "These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.", imageHref: "http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg")
        
        return [f1, f2, f3, f4]
    }
}
