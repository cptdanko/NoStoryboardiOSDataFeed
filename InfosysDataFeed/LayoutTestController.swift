//
//  BlueViewController.swift
//  InfosysDataFeed
//
//  Created by Bhuman Soni on 9/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import UIKit

/*
 This is just a controller to run all the practice UITests
 where the code isn't decoupled in an effort to provide
 more clarity when debugging.
 By deboupled, I mean, not MVVM separation of code and all
 */

class LayoutTestController: UIViewController {
    let reuseID = "CELL"
    var data = [FeedItem]()
    var tableView = UITableView()
    let extAPI = APIFactory.getFeedsAPI(apiType: .FACT)
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .cyan
        //setup the UITableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: reuseID)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300//some arbitary number
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        self.view = view
        extAPI.getFeed(url: "") { (feed, error) in
            if error != nil {
                print("fatal error occured")
                return
            }
            
            self.tableView.reloadData()
        }
    }
}
extension LayoutTestController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as! FeedTableViewCell
        let fData = data[indexPath.row]
        cell.titleLbl.text = fData.title
        cell.feedDescription.numberOfLines = 0
        cell.feedDescription.text = fData.description
        return cell
    }
    
}
