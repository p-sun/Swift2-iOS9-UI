//
//  SplashScreenViewController.swift
//  LaunchScreenWAnimation
//
//  Created by Paige Sun on 2017-05-23.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
	var destination: UIViewController?
	var logoImageView: UIImageView?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		print("view did load")

    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "EmbedLaunch" {
			destination = segue.destination
			logoImageView = (destination?.view.subviews[0] as? UIImageView) ?? nil
			setLogoImage()
			perform(#selector(SplashScreenViewController.animateTheLogo), with: nil, afterDelay: 1.0)
		}
	}
	
	private func setLogoImage() {
		logoImageView?.image = UIImage(named: "ThisIsFine")!
	}
	
	internal func animateTheLogo() {
		UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseOut, animations: {
			let zoom = CGAffineTransform(scaleX: 50, y: 50)
			self.logoImageView?.transform = zoom
			self.logoImageView?.alpha = 0.0
		}, completion: { completed in
			if (completed) {
				let myMainApp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootOfStoryboard") // Make sure the INITIAL view controller has an ID!
				UIWindow.mainWindow?.fadeInViewChanges{ [weak self] in
					self?.navigationController?.setViewControllers([myMainApp], animated: false) // because we've got a fade animation happening already.
				}
			}
		})
	}
}
