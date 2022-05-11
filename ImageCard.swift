//
//  ImageCard.swift
//  grub_project
//
//  Created by Robin Cha, Lawrence Tran, Jomel Bautista, Vishal Muddaraj on 11/28/17.
//  Copyright © 2017 De Anza. All rights reserved.
//

import UIKit

class ImageCard: CardView {
    var iRestaurant = ""
    var iName = ""
    var iImage = UIImage(named: "")
    var iThumb = UIImage(named: "")
    
    init(frame: CGRect, iImage: UIImage, iRestaurant: String, iName: String) {
        super.init(frame: frame)

        let imageView = UIImageView(image: iImage)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(red: 3/255, green: 212/255, blue: 199/255, alpha: 1)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 6, y: 8, width: 330, height: 280)
        self.addSubview(imageView)
        
        let restaurantName = UILabel()
        restaurantName.text = iRestaurant
        restaurantName.textColor = UIColor.white/*(red: 91/255, green: 148/255, blue: 149/255, alpha: 1)*/
        restaurantName.font = UIFont(name: "Avenir-Black", size: 25.0)
//        restaurantName.backgroundColor = UIColor(red: 203/255, green: 217/255, blue: 206/255, alpha: 1)
//        restaurantName.layer.cornerRadius = 2
//        restaurantName.layer.masksToBounds = true
        restaurantName.textAlignment = .left
        restaurantName.frame = CGRect(x: 6, y: imageView.frame.maxY + 15, width: 150, height: 20)
        restaurantName.sizeToFit()
        self.addSubview(restaurantName)
        
        let foodName = UILabel()
        foodName.text = iName
        foodName.textColor = UIColor.white/*(red: 91/255, green: 148/255, blue: 149/255, alpha: 1)*/
        foodName.font = UIFont(name: "Avenir-Medium", size: 20.0)
//        foodName.backgroundColor = UIColor(red: 203/255, green: 217/255, blue: 206/255, alpha: 1)
//        foodName.layer.cornerRadius = 2
//        foodName.layer.masksToBounds = true
        foodName.textAlignment = .left
        foodName.frame = CGRect(x: 6, y: restaurantName.frame.maxY + 10, width: 150, height: 20)
        foodName.sizeToFit()
        self.addSubview(foodName)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
