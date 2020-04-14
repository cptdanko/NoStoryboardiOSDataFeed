//
//  Parziveal.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 13/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

/*
 Protocol to ensure the class implementing it can parse json data
 */
protocol Prazieval {
    func parse<T:Decodable>(data: Data, type: T.Type, completionHandler: @escaping (T?, Error?) -> ())
}
