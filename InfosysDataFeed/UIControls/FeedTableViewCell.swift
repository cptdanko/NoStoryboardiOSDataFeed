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
    
    var titleLbl = UILabel()
    var feedDescription = UILabel()
    var feedImgView = UIImageView()
    //everytime we set the feed
    //we populate the cell values
    var feed:Feed! {
        didSet {
            DispatchQueue.main.async {
                self.titleLbl.text = self.feed.title
                print(self.feed.description)
                self.feedDescription.text = self.feed.description
            }
            
            //we need to do something about downloading the image
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    private func setupUI() {
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        feedDescription.translatesAutoresizingMaskIntoConstraints = false
        feedImgView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLbl)
        contentView.addSubview(feedDescription)
        contentView.addSubview(feedImgView)
        
        titleLbl.font = .boldSystemFont(ofSize: 17)
        titleLbl.textColor = .brown
        feedDescription.textColor = .gray
        feedDescription.font = .boldSystemFont(ofSize: 16)
        feedDescription.numberOfLines = 3
        
        let marginGuide = contentView.layoutMarginsGuide
        //feedImgView.leadingAnchor.constraint(greaterThanOrEqualTo: marginGuide.leadingAnchor, constant: CGFloat(20x))
        NSLayoutConstraint.activate([
            //feed image
            feedImgView.widthAnchor.constraint(equalToConstant: 60),
            feedImgView.heightAnchor.constraint(equalToConstant: 80),
            feedImgView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            feedImgView.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            feedImgView.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor),
            // feed title
            titleLbl.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            titleLbl.leadingAnchor.constraint(equalTo: feedImgView.trailingAnchor, constant: 8),
            titleLbl.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 5),
            // feed description
            feedDescription.topAnchor.constraint(greaterThanOrEqualTo: titleLbl.bottomAnchor, constant: 8),
            feedDescription.leadingAnchor.constraint(equalTo: feedImgView.trailingAnchor, constant: 8),
            feedDescription.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 5)
            ])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
