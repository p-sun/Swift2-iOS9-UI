//
//  ViewController.swift
//  UITableView-RainbowRows
//
//  Created by Paige Sun on 2016-08-13.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    let numRows = 100
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        let hue = CGFloat(indexPath.row)/CGFloat(numRows)
        cell.backgroundColor = UIColor(hue: hue, saturation: 0.7, brightness: 0.8, alpha: 1.0)
        return cell
    }

}
