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
    
    /*
     11/04/20: 3:52
     */
    private func setupUI() {
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        feedDescription.translatesAutoresizingMaskIntoConstraints = false
        feedImgView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLbl)
        contentView.addSubview(feedDescription)
        contentView.addSubview(feedImgView)
        
        titleLbl.font = .boldSystemFont(ofSize: 17)
        titleLbl.textColor = .brown
        feedDescription.font = .systemFont(ofSize: 15)
        feedDescription.numberOfLines = 0
        print("about to pring layout margins guide bottom anchor")
        print(layoutMarginsGuide.bottomAnchor)
        let marginGuide = contentView.layoutMarginsGuide
        //feedImgView.leadingAnchor.constraint(greaterThanOrEqualTo: marginGuide.leadingAnchor, constant: CGFloat(20x))
        let imgWidth = CGFloat(60)
        let imgHeight = CGFloat(80)
        
        //the constant values are just arbiratary numbers
        NSLayoutConstraint.activate([
            //feed image
            feedImgView.widthAnchor.constraint(equalToConstant: imgWidth),
            feedImgView.heightAnchor.constraint(equalToConstant: imgHeight),
            feedImgView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            feedImgView.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            feedImgView.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor),
            // feed title
            titleLbl.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            titleLbl.leadingAnchor.constraint(equalTo: feedImgView.trailingAnchor, constant: 8),
            titleLbl.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 5),
            //feed description constraints
            feedDescription.topAnchor.constraint(greaterThanOrEqualTo: titleLbl.bottomAnchor, constant: 8),
            feedDescription.leadingAnchor.constraint(equalTo: feedImgView.trailingAnchor, constant: 8),
            feedDescription.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 5),
            //feedDescription.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 5)
        ])
        //addBorderAround(view: titleLbl, color: .blue)
        //addBorderAround(view: feedDescription, color: .red)
    }
    //add border color around UIElements to help in
    //debugging when working with auto-layout programmatically
    private func addBorderAround(view: UIView, color: UIColor) {
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = 1.0
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
/*
 feedDescription.topAnchor.constraint(greaterThanOrEqualTo: titleLbl.bottomAnchor, constant: 8),
 feedDescription.leadingAnchor.constraint(equalTo: feedImgView.trailingAnchor, constant: 8),
 feedDescription.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 5)

 */
