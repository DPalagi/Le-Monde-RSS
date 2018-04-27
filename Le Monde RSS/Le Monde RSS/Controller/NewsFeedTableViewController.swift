//
//  NewsFeedTableViewController.swift
//  Le Monde RSS
//
//  Created by dpalagi on 26/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {

    // MARK: - Properties
    var newsItems: [NewsItem] = []

    // MARK: - Events
    override func viewDidLoad() {
        super.viewDidLoad()
        // Bind pull to refresh
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadNewsItems), for: UIControlEvents.valueChanged)
        self.refreshControl = refreshControl
        // Load first data
//        refreshControl.beginRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Methods
    @objc func loadNewsItems() {
        APIManager.fetchNewsFeed(Constants().baseUrl) { (response) in
            switch response {
            case .success(object: let channel):
                self.newsItems = channel.items
                self.tableView.reloadData()
            case.error(e: let error):
                // TODO display error to user
                print(error)
            }
            self.refreshControl?.endRefreshing()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = newsItems[indexPath.row].title
        return cell
    }

}