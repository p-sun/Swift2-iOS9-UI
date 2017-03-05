//
//  UIView+Extensions.swift
//  SafariViewController
//
//  Created by Paige Sun on 2017-03-05.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import UIKit
extension UIView {
    func constrainToBeCenteredInView(_ otherView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraintsToBeCenteredInView(otherView))
    }
    
    func constraintsToBeCenteredInView(_ otherView: UIView) -> [NSLayoutConstraint] {
        return [
            centerXAnchor.constraint(equalTo: otherView.centerXAnchor),
            centerYAnchor.constraint(equalTo: otherView.centerYAnchor)
        ]
    }
}
