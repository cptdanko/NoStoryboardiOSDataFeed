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
    
    func pin(_ parentView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
    }
    func addActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(frame: self.bounds)
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.25)
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    func removeIndicatorOnLoad() {
        for view in subviews {
            if let acIndicator =  view as? UIActivityIndicatorView {
                DispatchQueue.main.async() {
                    acIndicator.removeFromSuperview()
                }
            }
        }
    }
}
