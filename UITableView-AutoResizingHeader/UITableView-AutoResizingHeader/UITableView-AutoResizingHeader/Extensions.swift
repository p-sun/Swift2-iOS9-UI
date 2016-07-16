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
    
    /** Resize a tableView header to according to the size of its contents. i.e. This method is useful for a headerView with a dynamically set text label. Can set a UIView.animateWithDuration block around this to animate the new height changes.
     
     Usage:
     
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit(tableView)
     }
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
    