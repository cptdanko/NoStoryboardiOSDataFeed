//
//  Parser.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 13/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

class Parser: Prazieval {
    
    static let shared = Parser()
    /*
     We could be decoding any type of class, hence this funciton is generic. So
     at any point, we can decode (convert) any class T that conforms to the decodable
     protocol from the given data using the JSONDecoder
    */
    func parse<T:Decodable>(data: Data, type: T.Type, completionHandler: @escaping (T?, Error?) -> ()) {
        var parsedData: T?
        do {
            let decoder = JSONDecoder()
            parsedData = try decoder.decode(T.self, from: data)
            completionHandler(parsedData, nil)
        } catch let error {
            completionHandler(nil, ErrorResultType.parser(string: "Error occured because \n->\(error.localizedDescription)"))
        }
    }
}
