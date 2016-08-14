//
//  ViewController.swift
//  UITableView-CompressableHeadersEffect
//
//  Created by Paige Sun on 2016-08-07.
//  Copyright © 2016 Paige Sun. All rights reserved.
//
//  --- What is contentInset and contentOffset? ---
//  By default in a tableView, the contentView is the same size as the enclosing scrollView.
//  contentInset increases the scrollView size by setting paddings around the contentView.
//  The contentInset sets the max values of how far the contentOffset can be go scroll beyond its default scrollable area.
//  e.g. inset = 10 for the top inset value allows offset’s y value to reach -10
//  To view an example, change left insets = 30 using UIEdgeInsetsMake(headerMaxHeight, 30, 0, 0)

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
        let didScrollPastMinHeaderHeight = tableView.contentOffset.y < -headerMinHeight
        let headerHeight = didScrollPastMinHeaderHeight ? -tableView.contentOffset.y : headerMinHeight
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
