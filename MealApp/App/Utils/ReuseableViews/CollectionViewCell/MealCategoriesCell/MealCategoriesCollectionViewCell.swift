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
    var category: MealCategory? {
        didSet {
            setupUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnCategory.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.categoryClick?(self.category!)
            print(self.category!)
        }), for: .touchUpInside)
    }
    
    func configure(category: MealCategory) {
        self.category = category
    }
    
    func setupUI() {
        var config = UIButton.Configuration.plain()
        config.titleLineBreakMode = .byTruncatingTail
        config.title = category?.category
        btnCategory.configuration = config
        btnCategory.titleLabel?.numberOfLines = 1
        btnCategory.layer.cornerRadius = 15
        btnCategory.tintColor = .white
        btnCategory.backgroundColor = .black
    }

}
