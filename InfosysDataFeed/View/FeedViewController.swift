//
//  ViewController.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 9/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import UIKit
import SDWebImage

class FeedViewController: UIViewController {

    fileprivate var tableView: UITableView!
    fileprivate var viewModel: FeedViewModel!
    @objc var refreshFeed: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        viewModel = FeedViewModel(parentController: self)
        //update the title dynamically based on the info fetched from the
        //API call
         //self.navigationItem.title = "Fact Feed"
        //setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
        viewModel.getFactsData(from: CONSTANTS.DEFAULT_FACTS_URL)
    }
    /*
     Setup basic initial UI, add the UIControls to
     the main View and then size it with auto-layout
     constraints
     */
    func setupUI() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //add the tableView to the UIView so it has a relationship before we apply
        //auto layout constraints
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(50)).isActive = true
        
        //add the UIRefreshControl to the UITableView
        refreshFeed = UIRefreshControl()
        refreshFeed.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        tableView.refreshControl = refreshFeed
        
        tableView.dataSource = self
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.cellIdentifier)
    }
    @objc func handleRefreshControl() {
        viewModel.refreshFeed()
    }
    
    func updateNavigation(title to: String?) {
        self.navigationItem.title = to
    }
}
/*
 FeedViewController to handle all the UITableView logic
 */
extension FeedViewController: UITableViewDataSource {
    
    func reloadData() {
        self.tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    /*
     Now loading the images using SDWebImage as it does all the heavy lifting for us
     i.e. adding the bit about asynchoronous image data fetching etc
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.cellIdentifier) as! FeedTableViewCell
        
        let dataRow = viewModel.feedArray[indexPath.section]
        if let dr = dataRow {
            let feedAtRow = dr[indexPath.row]
            cell.titleLbl.text = feedAtRow.title
            cell.feedDescription.text = feedAtRow.description
            cell.feed = feedAtRow
            cell.feedImgView.addActivityIndicator()
            if let urlStr = feedAtRow.imageHref {
                let url = URL(string: urlStr)
                cell.feedImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "defaultPhoto")) { (img, error, cacheType, url) in
                    cell.feedImgView.removeIndicatorOnLoad()
                }
            }
        } else {
            cell.feedImgView.image = UIImage(named: "defaultPhoto")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
/*
ADDED THESE CODE HERE, AS NOT SURE WHETHER OR NOT
WE CAN USE SD_WEBIMAGE
DispatchQueue.main.async {
    if let urlStr = feedAtRow.imageHref {
       let url = URL(string: urlStr)
        if let data = try? Data(contentsOf: url!) {
            cell.feedImgView.image = UIImage(data: data)
            cell.feedImgView.removeIndicatorOnLoad()
        } else {
            cell.feedImgView.removeIndicatorOnLoad()
            cell.feedImgView.image = UIImage(named: "defaultPhoto")
        }
    }
}
*/
