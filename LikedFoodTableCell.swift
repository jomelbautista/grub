//
//  LikedFoodTableCell.swift
//  grub_project
//
//  Created by Robin Cha, Lawrence Tran, Jomel Bautista, Vishal Muddaraj on 11/28/17.
//  Copyright © 2017 De Anza. All rights reserved.
//

import UIKit

class LikedFoodTableCell: UITableViewCell {
    

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var backgroundLikedCardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Backgrond Card View
        backgroundLikedCardView.backgroundColor = UIColor(named: "GrubOrange")
        contentView.backgroundColor = UIColor(named: "GrubRed")
        backgroundLikedCardView.layer.cornerRadius = 3.0
        backgroundLikedCardView.layer.masksToBounds = false
        
        // Label colors
        foodNameLabel.textColor = UIColor.white
        restaurantNameLabel.textColor = UIColor.white
        addressLabel.textColor = UIColor.white
        priceLabel.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
