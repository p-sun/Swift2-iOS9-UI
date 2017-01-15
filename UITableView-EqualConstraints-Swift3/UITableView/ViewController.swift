//
//  ViewController.swift
//  UITableView
//
//  Created by Paige Sun on 2016-05-03.
//  Copyright © 2016 Paige Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    let data = ["Item 1", "Item 2", "Item 3", "Item 4"]

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:

            // Programically create two equal sized buttons
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoButtonCellProgramically", for: indexPath) as! TwoButtonCellProgramically
            return cell
            
        case 1:
            
            // Use storyboard to create to equal sized buttons
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoButtonCell2", for: indexPath)
            return cell

        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoButtonCellStoryboard2", for: indexPath)
            return cell

        default:
            
            // To see if you have a Stackview constrainted correctly, you can use the Debug View Hierachy, but you cannot see it by setting a background color on the StackView
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoButtonCell3", for: indexPath)
            return cell
        }

    }

}

