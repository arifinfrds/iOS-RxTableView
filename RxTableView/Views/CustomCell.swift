//
//  CustomTableViewCEll.swift
//  RxTableView
//
//  Created by Arifin Firdaus on 1/26/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
