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

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
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
            
            // An experiment to play with StackView Distribution and Alignment of the StackView
            // Alignment - Fill, Distribution - FillEqually
            // This ignores the content hugging priority, even if you set the middle divider's content hugging priority to 1000
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoButtonCellEqual", for: indexPath)
            return cell

        case 3:
            
            // A cell with a switch on the right side, using the stock textLabel and accessoryView that comes with the native UITableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCellSimple", for: indexPath)
            cell.textLabel?.text = "Here is a long piece of text that goes on and on and on. Here is a long piece of text that goes on and on"
            cell.textLabel?.numberOfLines = 0
            cell.accessoryView = UISwitch()
            return cell
            
        case 4:
            
            // A cell with a switch on the right side, using a label and a UISwitch constrained to margins
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCellStack", for: indexPath)
            return cell
            
        case 5:
            
            // A cell with a switch on the right side, constrained programically
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCellProgramically", for: indexPath) as! SwitchCellProgramically
            return cell

        case 6:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccessoryViewCell", for: indexPath)
            return cell
            
        case 7:

            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftAccessoryCell", for: indexPath)
            return cell

        default:
            
            // An empty stack view
            // To see if you have a Stackview constrainted correctly, you can use the Debug View Hierachy, but you cannot see it by setting a background color on the StackView
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleStackView", for: indexPath)
            return cell
        }

    }

}
