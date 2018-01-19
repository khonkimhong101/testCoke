//
//  ModelViewCell.swift
//  EShop
//
//  Created by Pathmazing on 3/16/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit

class ModelViewCell: UICollectionViewCell {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelPrice: UILabel!
    @IBOutlet var viewBackground: UIView!
    
    override func awakeFromNib() {
        viewBackground.layer.cornerRadius = 5.0
    }
}
