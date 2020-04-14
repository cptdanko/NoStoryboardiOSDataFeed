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
    
    func getFeed(urlStr: String, completionHandler: @escaping (Feed?, ErrorResultType?) -> ()) {
        guard let url = URL(string: urlStr) else {
            completionHandler(nil, ErrorResultType.custom(string: "Url parsing error"))
            return
        }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let d = data else {
                completionHandler(nil, ErrorResultType.network(string: "Network error"))
                return
            }
            /* we are converting it to UTF8 encoding to avoid the
            "Unable to convert data to string around character 2643" error
             */
            let str = String(data: d, encoding: .isoLatin1)
            let data8 = str?.data(using: .utf8)
            Parser.shared.parse(data: data8!, type: Feed.self) { (feed, error) in
                guard let f = feed else {
                    completionHandler(nil, ErrorResultType.parser(string: "Error parsing data"))
                    return
                }
                completionHandler(f, nil)
            }
        }
        task.resume()
        return
    }
}
