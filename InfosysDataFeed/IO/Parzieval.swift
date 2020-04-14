//
//  Parziveal.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 13/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

protocol Prazieval {
    func parse<T:Decodable>(data: Data, type: T.Type, completionHandler: @escaping (T?, Error?) -> ())
}
