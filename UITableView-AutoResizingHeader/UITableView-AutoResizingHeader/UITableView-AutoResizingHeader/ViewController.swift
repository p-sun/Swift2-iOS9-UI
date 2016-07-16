//
//  ViewController.swift
//  UITableView-AutoResizingHeader
//
//  Created by Paige Sun on 2016-07-16.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // This is where the magic happens.
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit(tableView)
    }
    
    // Add more text and resize header.
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
        // Simply set this label's lines to 0
    
    @IBAction func addMoreText(sender: AnyObject) {
        self.label.text = self.label.text! + "\nThis header can dynamically resize according to its contents."
    }
    
    // Make button taller and resize header with Animation.

    @IBOutlet weak var makeThisTallerHeight: NSLayoutConstraint!
    @IBAction func makeThisTaller(sender: AnyObject) {
        
        self.makeThisTallerHeight.constant += 20
        UIView.animateWithDuration(0.3) {
            self.tableView.beginUpdates()
            self.sizeHeaderToFit(self.tableView)
            self.tableView.endUpdates()
        }
    }
    
}

