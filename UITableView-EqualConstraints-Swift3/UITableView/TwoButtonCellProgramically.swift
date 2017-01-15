//
//  TwoButtonCellProgramically.swift
//  UITableView
//
//  Created by Paige Sun on 2017-01-13.
//  Copyright © 2017 Paige Sun. All rights reserved.
//

import UIKit

class TwoButtonCellProgramically: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let buttons = UIStackView()
//        buttons.distribution = .fill
//        buttons.alignment = .fill
//        buttons.spacing = 0
        buttons.axis = .horizontal

        buttons.translatesAutoresizingMaskIntoConstraints = false // IMPORTANT

        let button1 = UIButton()
        button1.backgroundColor = UIColor.lightGray
        let button2 = UIButton()
        button2.backgroundColor = .green
        let line = UIView()
        line.backgroundColor = .blue
        
        contentView.addSubview(buttons)
        buttons.addArrangedSubview(button1)
        buttons.addArrangedSubview(line)
        buttons.addArrangedSubview(button2)
        
        NSLayoutConstraint.activate([
            
            buttons.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            buttons.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            buttons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            buttons.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            line.widthAnchor.constraint(equalToConstant: 1),

            button1.widthAnchor.constraint(equalTo: button2.widthAnchor, multiplier: 1)
            ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
