//
//  MealCardCollectionViewCell.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import UIKit
import SDWebImage

class MealCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mealsImage: UIImageView!
    @IBOutlet weak var mealsTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with meal: Meal) {
        mealsImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        mealsImage.sd_setImage(with: URL(string: meal.imageUrl ?? ""))
        mealsTitle.text = meal.name
    }

}
