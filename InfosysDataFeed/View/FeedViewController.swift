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

    var tableView: UITableView!
    var viewModel: FeedViewModel!
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
        self.navigationItem.title = "Fact Feed"
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
        let test = FeedViewModel(parentController: self)
        refreshFeed.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        tableView.refreshControl = refreshFeed
        
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 600
        
        tableView.dataSource = self
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.cellIdentifier)
    }
    @objc func handleRefreshControl() {
        print("FeedViewController.handleRefreshControl called")
        viewModel.refreshFeed()
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
        let feedAtRow = viewModel.data[indexPath.row]
        cell.titleLbl.text = feedAtRow.title
        cell.feedDescription.text = feedAtRow.description
        cell.feed = feedAtRow
        cell.feedImgView.addActivityIndicator()
        if let urlStr = feedAtRow.imageHref {
            let url = URL(string: urlStr)
            cell.feedImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "defaultPhoto")) { (img, error, cacheType, url) in
                cell.feedImgView.removeIndicatorOnLoad()
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

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //refresh the table height
    }
}
