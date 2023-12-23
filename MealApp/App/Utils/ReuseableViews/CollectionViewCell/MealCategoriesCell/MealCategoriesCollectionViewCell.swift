//
//  MealCategoriesCollectionViewCell.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import UIKit

class MealCategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var btnCategory: UIButton!
    
    var categoryClick: ((MealCategory) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(category: MealCategory) {
        btnCategory.setTitle(category.category, for: .normal)
        btnCategory.titleLabel?.lineBreakMode = .byClipping
        btnCategory.tintColor = .white
        btnCategory.addAction(UIAction(handler: { [weak self] _ in
            self?.categoryClick?(category)
        }), for: .touchUpInside)
    }

}
