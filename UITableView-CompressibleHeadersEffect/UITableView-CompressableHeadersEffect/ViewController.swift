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
    
    // MARK - Resizing Header
    
    let headerMaxHeight: CGFloat = 330
    let headerMinHeight: CGFloat = 130

    var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tableView.tableHeaderView
        headerView.clipsToBounds = true
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsetsMake(headerMaxHeight, 0, 0, 0) // (top, left, bottom, right)
        tableView.contentOffset = CGPoint(x: 0, y: -headerMaxHeight)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.updateHeaderView()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerHeight = headerMinHeight
        if tableView.contentOffset.y < -headerMinHeight {
            headerHeight = -tableView.contentOffset.y
        }
        headerView.frame = CGRect(x: 0, y: tableView.contentOffset.y, width: tableView.bounds.width, height: headerHeight)
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
