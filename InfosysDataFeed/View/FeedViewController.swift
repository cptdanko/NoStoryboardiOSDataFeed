//
//  ViewController.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 9/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    var tableView: UITableView!
    var viewModel: FeedViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        tableView = UITableView()
        viewModel = FeedViewModel(parentController: self)
        self.navigationItem.title = "Back"
        //get the fact Feed
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
        viewModel.getFactsData(from: CONSTANTS.FACTS_URL)
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
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.cellIdentifier)
    }
}
/*
 FeedViewController to handle all the UITableView logic
 */
extension FeedViewController: UITableViewDataSource {
    
    func reloadData() {
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.cellIdentifier) as! FeedTableViewCell
        let feedAtRow = viewModel.data[indexPath.row]
        cell.feed = feedAtRow
        //cell.feed = feedAtRow
        //print(feedAtRow.description)
        //print(feedAtRow.title)
        return cell
    }
    
}
