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
    
    let numRows = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEmptyFooterView(tableView)
        tableView.backgroundColor = UIColor(red: 147/255, green: 184/255, blue: 37/255, alpha: 1.0)
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
        return numRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Item \(indexPath.row)"
        return cell
    }

}
