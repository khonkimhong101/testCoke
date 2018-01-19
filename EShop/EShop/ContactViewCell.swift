//
//  ContactViewCell.swift
//  EShop
//
//  Created by Pathmazing on 3/16/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit

class ContactViewCell: UITableViewCell {
    
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblContact: UILabel!
    @IBOutlet var lblLocation: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        viewBackground.layer.cornerRadius = 5.0
    }
    
}
