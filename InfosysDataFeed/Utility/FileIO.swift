//
//  FileIO.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 13/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

class FileIO {
    
    static func readJSONData(from file: String, extension: String = ".json") -> Data? {
        if let path = Bundle.main.path(forResource: "facts", ofType: ".json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedRead)
                return data
            } catch let error {
                print("error is -> \(error.localizedDescription)")
                return nil
            }
        }
        return nil
    }
}
