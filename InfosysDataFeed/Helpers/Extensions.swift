//
//  Extensions.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 11/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(_ parentView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
    }
}
