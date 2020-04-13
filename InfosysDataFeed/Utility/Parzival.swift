//
//  Parzival.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 13/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

/*
 
 */
protocol Parzival {
    static func parseObject(data: Data) -> Result<Self, ErrorResultType>
}
