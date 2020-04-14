//
//  DialogHelper.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 14/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import UIKit

class DialogHelper {
    
    static let shared = DialogHelper()
    
    func getAlert(title: String, message: String, alertActions: [UIAlertAction]?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        if let a = alertActions {
            for action in a {
                alert.addAction(action)
            }
        } else {
            alert.addAction(okAction)
        }
        return alert
    }
}
