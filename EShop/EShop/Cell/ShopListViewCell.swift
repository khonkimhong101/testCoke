//
//  ShopListViewCell.swift
//  EShop
//
//  Created by Pathmazing on 3/17/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit

class ShopListViewCell: UITableViewCell {
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
