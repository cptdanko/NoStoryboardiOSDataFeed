//
//  ErrorResultType.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 13/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

/*
 So we know the type of error occuring
 */

enum ErrorResultType: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
