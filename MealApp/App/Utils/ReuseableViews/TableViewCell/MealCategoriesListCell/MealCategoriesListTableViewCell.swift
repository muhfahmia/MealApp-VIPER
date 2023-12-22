//
//  MealCategoriesListTableViewCell.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import UIKit

class MealCategoriesListTableViewCell: UITableViewCell, UICollectionViewDataSource {

    @IBOutlet weak var mealCategoriesCV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        self.layoutIfNeeded()
//        return mealCategoriesCV.contentSize
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        mealCategoriesCV.dataSource = self
        mealCategoriesCV.register(nibWithCellClass: MealCategoriesCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MealCategoriesCollectionViewCell = collectionView.dequeueReusableCell(withClass: MealCategoriesCollectionViewCell.self, for: indexPath)
        return cell
    }
    
}
