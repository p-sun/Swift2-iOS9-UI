//
//  ViewController.swift
//  UITableView-AutoResizingHeader
//
//  Created by Paige Sun on 2016-07-16.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Add more text and resize header.
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
        // Simply set this label's lines to 0
    
    @IBAction func addMoreText(_ sender: AnyObject) {
        self.label.text = self.label.text! + "\nThis header can dynamically resize according to its contents."
    }
    
    override func viewDidLayoutSubviews() {
        // viewDidLayoutSubviews is called when labels change.
        super.viewDidLayoutSubviews()
        tableView.sizeHeaderToFit()
    }
    
    // Make button taller and resize header with animation.

    @IBOutlet weak var makeThisTallerHeight: NSLayoutConstraint!
    
    @IBAction func makeThisTaller(_ sender: AnyObject) {
        // Animated
        UIView.animate(withDuration: 0.3, animations: {
            self.tableView.beginUpdates()
            self.makeThisTallerHeight.constant += 20
            self.tableView.sizeHeaderToFit()
            self.tableView.endUpdates()
        }) 
        
        // Non-Animated
//        self.makeThisTallerHeight.constant += 20
//        self.tableView.sizeHeaderToFit()
    }
    
}
