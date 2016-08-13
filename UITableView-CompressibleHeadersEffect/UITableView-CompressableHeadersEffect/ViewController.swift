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
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsetsMake(headerMaxHeight, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerMaxHeight)
        headerView.clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.updateHeaderView()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -headerMaxHeight, width: tableView.bounds.width, height: headerMaxHeight)
        headerRect.origin.y = tableView.contentOffset.y
        if tableView.contentOffset.y < -headerMinHeight {
            headerRect.size.height = -tableView.contentOffset.y
        } else {
            headerRect.size.height = headerMinHeight
        }
        headerView.frame = headerRect
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
