//
//  MealCategoriesListTableViewCell.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import UIKit

class MealCategoriesListTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var mealCategoriesCV: UICollectionView!
    
    var categories: [MealCategory] = []
    var getMealByCategory: ((MealCategory) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        mealCategoriesCV.dataSource = self
        mealCategoriesCV.delegate = self
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        mealCategoriesCV.collectionViewLayout = layout
        mealCategoriesCV.register(nibWithCellClass: MealCategoriesCollectionViewCell.self)
    }
    
    func configure(categories: [MealCategory]) {
        self.categories = categories
        mealCategoriesCV.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MealCategoriesCollectionViewCell = collectionView.dequeueReusableCell(withClass: MealCategoriesCollectionViewCell.self, for: indexPath)
        let category = categories[indexPath.row]
        cell.categoryClick = { [weak self] category in
            self?.getMealByCategory!(category)
        }
        cell.configure(category: category)
        return cell
    }
    
}
