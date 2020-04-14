//
//  FileIO.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 13/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation

class FileIO {
    /*
     A debug method kept in here for testing purposes
     or to revert to the locally saved file in the event we don't have
     network access.
     */
    static func readJSONData(from file: String, fileExt: String = ".json") -> Data? {
        guard let path = Bundle.main.path(forResource: "facts", ofType: fileExt) else {
            fatalError("Unable to read json file")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedRead)
            return data
        } catch let error {
            print("error is -> \(error.localizedDescription)")
            return nil
        }
    }
}
