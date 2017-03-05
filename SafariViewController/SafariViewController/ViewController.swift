//
//  ViewController.swift
//  SafariViewController
//
//  Created by Paige Sun on 2017-03-05.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    @IBAction func sfSafariTapped(_ sender: Any) {
        let url = URL(string: "https://www.shopify.ca")!
        let safari = SFSafariViewController(url: url)
        safari.title = "Shopify"
        safari.delegate = self
        present(safari, animated: true, completion: nil)
    }
    
    @IBAction func safariTapped(_ sender: Any) {
    }
}

extension ViewController: SFSafariViewControllerDelegate {
}

