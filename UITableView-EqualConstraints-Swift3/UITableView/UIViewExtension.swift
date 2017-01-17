//
//  UIViewExtension.swift
//
//  Created by Paige Sun on 2017-01-17.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import UIKit

public extension UIView {
    func addSubviewsForAutolayout(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}
