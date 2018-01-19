//
//  HomeListViewCell.swift
//  EShop
//
//  Created by Pathmazing on 3/16/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit

class HomeListViewCell: UICollectionViewCell {
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var LabelPrice: UILabel!

    override func awakeFromNib() {
         viewBackground.layer.cornerRadius = 5.0
    }
    
}
