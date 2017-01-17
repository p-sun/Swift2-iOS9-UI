//
//  SwitchCellProgramically.swift
//  UITableView
//
//  Created by Paige Sun on 2017-01-17.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import UIKit

class SwitchCellProgramically: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        let label = UILabel()
        label.text = "This row is done programically."
        let switchControl = UISwitch()
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(switchControl)
        contentView.addSubviewsForAutolayout(stack)
        
        contentView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: margins.topAnchor),
            stack.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
            ])
    }

}
