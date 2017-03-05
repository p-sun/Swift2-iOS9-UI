//
//  SafariViewController.swift
//  SafariViewController
//
//  Created by Paige Sun on 2017-03-05.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import Foundation
import SafariServices

protocol SafariViewControllerDelegate: class {
    func safariControllerDidFinish(_ controller: SafariViewController)
}

class SafariViewController: UINavigationController {
    fileprivate weak var safariDelegate: SafariViewControllerDelegate?
    fileprivate var safariTitle: String!
    fileprivate var url: URL!
    
    fileprivate weak var spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    init(safariDelegate: SafariViewControllerDelegate, safariTitle: String = "", url: URL) {
        super.init(navigationBarClass: nil, toolbarClass: nil)
        self.safariDelegate = safariDelegate
        self.url = url
        self.safariTitle = safariTitle
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([sfSafariViewController], animated: false)
        addSpinner()
    }
    
    private func addSpinner() {
        if let spinner = spinner {
            self.view.addSubview(spinner)
            spinner.constrainToBeCenteredInView(view)
            spinner.startAnimating()
        }
    }
}

// MARK: SFSafariViewController

extension SafariViewController {
    fileprivate var sfSafariViewController: SFSafariViewController {
        let safari = SFSafariViewController(url: url)
        safari.title = safariTitle
        safari.delegate = self
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.didTapDone))
        _ = safari.navigationItem.leftBarButtonItem = doneButton
        
        return safari
    }
    
    func didTapDone() {
        dismiss(animated: true) {
            self.safariDelegate?.safariControllerDidFinish(self)
        }
    }
}

extension SafariViewController: SFSafariViewControllerDelegate {
    func safwariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        spinner?.isHidden = true
        if didLoadSuccessfully {
        } else {
            print("Please check your network connections")
        }
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("safarai finished")
    }
}
