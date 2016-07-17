//
//  ViewController.swift
//  UITableView-AutoResizingTable
//
//  Created by Paige Sun on 2016-07-16.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEmptyFooterView(tableView)
        tableView.backgroundColor = UIColor.grayColor()
    }
    
    /** Add an empty footer view so that the tableView will automatically be sized according to the contents.
     */
    func addEmptyFooterView(tableView: UITableView) {
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 0)
        tableView.tableFooterView = UIView(frame: frame)
        tableView.tableFooterView?.backgroundColor = .clearColor()
    }
    
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
