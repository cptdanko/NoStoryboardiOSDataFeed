//
//  UIView.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 11/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func addActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(frame: self.bounds)
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.25)
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
    }
    public func removeIndicatorOnLoad() {
        for view in subviews {
            if let acIndicator =  view as? UIActivityIndicatorView {
                DispatchQueue.main.async() {
                    acIndicator.removeFromSuperview()
                }
            }
        }
    }
}
