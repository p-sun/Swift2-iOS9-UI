//
//  ViewController.swift
//  UITableView
//
//  Created by Paige Sun on 2016-05-03.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    let data = ["Item 1", "Item 2", "Item 3", "Item 4"]

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

}

