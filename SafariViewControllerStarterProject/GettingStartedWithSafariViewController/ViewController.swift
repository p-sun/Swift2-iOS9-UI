//
//  ViewController.swift
//  GettingStartedWithSafariViewController
//
//  Created by Jordan Morgan on 6/25/15.
//  Copyright © 2015 Jordan Morgan. All rights reserved.
//

import UIKit
import SafariServices // SAFARI 1

class ViewController: UIViewController, SFSafariViewControllerDelegate
{
    private var urlString:String = "https://google.com"

    //MARK: Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Web Content Presenting
    @IBAction func openInSafari(sender: AnyObject)
    {
        // Open in native safari
        let url = NSURL(string: self.urlString)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func openWithSafariVC(sender: AnyObject) // SAFARI 2
    {
        // Open in safari view controller
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!)
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    
//    func safariViewControllerDidFinish(controller: SFSafariViewController)
//    {
//        controller.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //TODO: open in webview
    }
}

