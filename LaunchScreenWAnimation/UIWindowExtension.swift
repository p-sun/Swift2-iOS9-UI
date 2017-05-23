//
//  UIWindowExtension.swift
//  LaunchScreenWAnimation
//
//  Created by Paige Sun on 2017-05-23.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import Foundation

import UIKit

extension UIWindow {
	static var mainWindow: UIWindow? {
		return UIApplication.shared.keyWindow
	}
	
	func fadeInViewChanges(viewChanges:(Void) -> (Void)) {
		
		// snapshot current window
		let snapshot = self.snapshotView(afterScreenUpdates: false)!
		self.addSubview(snapshot)
		
		// make underneath changes
		viewChanges()
		
		// fade out snapshot
		UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseOut, animations: {
			snapshot.alpha = 0.0;
		}, completion: { finished in
			snapshot.removeFromSuperview()
		})
	}

}
