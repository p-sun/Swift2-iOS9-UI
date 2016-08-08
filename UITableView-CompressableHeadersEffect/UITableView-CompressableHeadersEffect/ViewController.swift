//
//  ViewController.swift
//  UITableView-CompressableHeadersEffect
//
//  Created by Paige Sun on 2016-08-07.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!

    // MARK - Resizing Header

    let headerMinHeight: CGFloat = 140.0
    let headerMaxHeight: CGFloat = 300.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerHeight.constant = headerMaxHeight
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //print("offset: \(scrollView.contentOffset.y)")
        if scrollView.contentOffset.y > headerMaxHeight-headerMinHeight {
            headerHeight.constant = headerMinHeight
        } else if scrollView.contentOffset.y > 0 {
            headerHeight.constant = headerMaxHeight-scrollView.contentOffset.y
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 27
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}
