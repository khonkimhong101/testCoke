//
//  DescriptionViewCell.swift
//  EShop
//
//  Created by Pathmazing on 3/16/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit

class DescriptionViewCell: UITableViewCell {
    @IBOutlet var lblColor: UILabel!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        viewBackground.layer.cornerRadius = 5.0
    }
    
}
