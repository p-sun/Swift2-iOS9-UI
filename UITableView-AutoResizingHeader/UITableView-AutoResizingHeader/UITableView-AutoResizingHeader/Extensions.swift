//
//  Extensions.swift
//  UITableView-AutoResizingHeader
//
//  Created by Paige Sun on 2016-07-16.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /** Resize a tableView header to according to the auto layout of its contents. 
        - This method can resize a headerView according to changes in a dynamically set text label. Simply place this method inside viewDidLayoutSubviews.
        - To animate constrainsts, wrap a tableview.beginUpdates and .endUpdates, followed by a UIView.animateWithDuration block around constraint changes.
     */
    func sizeHeaderToFit(tableView: UITableView) {
        if let headerView = tableView.tableHeaderView {
            let height = headerView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
            var frame = headerView.frame
            frame.size.height = height
            headerView.frame = frame
            tableView.tableHeaderView = headerView
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
        }
    }
    
}
