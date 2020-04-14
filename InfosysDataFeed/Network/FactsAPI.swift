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
    
    func getFeed(urlStr: String, completionHandler: @escaping (Feed?, Error?) -> ()) {
        guard let url = URL(string: urlStr) else {
            print("Trouble reading the url")
            return
        }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let d = data else {
                completionHandler(nil, error)
                return
            }
            /* we are converting it to UTF8 encoding to avoid the
            "Unable to convert data to string around character 2643" error
             */
            let str = String(data: d, encoding: .isoLatin1)
            let data8 = str?.data(using: .utf8)
            Parser.shared.parse(data: data8!, type: Feed.self) { (feed, error) in
                guard let f = feed else {
                    completionHandler(nil, error)
                    return
                }
                completionHandler(f, nil)
            }
        }
        task.resume()
        return
    }
}
/*
 REDUNDANT CODE - NOT TO BE USED ANYMORE
 if let data = FileIO.readJSONData(from: "facts") {
    Parser.shared.parse(data: data, type: Feed.self) { (feed, error) in
        if error != nil {
            completionHandler(nil, error)
        }
        completionHandler(feed, nil)
    }
 
 func readNetworkData() {
        guard let url = URL(string: CONSTANTS.DEFAULT_FACTS_URL) else {
            print("Trouble reading the url")
            return
        }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error fetching data")
            }
            guard let d = data else {
                print("Error parsing data")
                return
            }
            /* we are converting it to UTF8 encoding to avoid the
            "Unable to convert data to string around character 2643" error
             */
            let str = String(data: d, encoding: .isoLatin1)
            let data8 = str?.data(using: .utf8)
            Parser.shared.parse(data: data8!, type: Feed.self) { (feed, error) in
                print(feed?.rows?.count)
                print(feed?.title)
            }
        }
        task.resume()
        return
    }
}*/
