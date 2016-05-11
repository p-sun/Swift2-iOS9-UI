//
//  CustomWebViewController.swift
//  GettingStartedWithSafariViewController
//
//  Created by Jordan Morgan on 6/25/15.
//  Copyright © 2015 Jordan Morgan. All rights reserved.
//

import UIKit
import WebKit

class CustomWebViewController: UIViewController
{
    var urlString:String?
    private var webView:UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        webView = UIWebView(frame: self.view.frame)
        var url:NSURL
        
        if let desiredURL = urlString
        {
            url = NSURL(string: desiredURL)!
        }
        else
        {
            url = NSURL(string: "https://www.google.com")!
        }
        
        webView.loadRequest(NSURLRequest(URL: url))
        self.view.addSubview(webView)
    }

    //Closes the browser and dismisses this view controller.
    @IBAction func close(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
