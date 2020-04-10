//
//  FeedTableViewCell.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 9/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "FEED_CELL"
    
    var titleLbl: UILabel!
    var feedDescription: UITextView!
    var feedImg: UIImage!
    //everytime we set the feed
    //we populate the cell values
    var feed:Feed! {
        didSet {
            titleLbl.text = feed.title
            feedDescription.text = feed.description
            //we need to do something about downloading the image
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
