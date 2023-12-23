//
//  MealCardTableViewCell.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import UIKit

class MealCardTableViewCell: UITableViewCell {
   
   @IBOutlet weak var mealsCardCL: UICollectionView!
    var meals: [Meal]?
    var mealClicked: ((Meal) -> Void)?
    
    override func awakeFromNib() {
       super.awakeFromNib()
       setupUI()
   }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
   }
   
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.layoutIfNeeded()
        return CGSize(width: mealsCardCL.contentSize.width, height: mealsCardCL.contentSize.height+24)
   }
   
   func setupUI() {
       mealsCardCL.dataSource = self
       mealsCardCL.delegate = self
       mealsCardCL.register(nibWithCellClass: MealCardCollectionViewCell.self)
   }
   
    func configure(with meals: [Meal]) {
       self.meals = meals
       mealsCardCL.reloadData()
   }
   
}

extension MealCardTableViewCell: UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       1
   }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: MealCardCollectionViewCell.self, for: indexPath)
       cell.configure(with: meals![indexPath.row])
       return cell
   }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return meals?.count ?? 0
   }
   
}

extension MealCardTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = UIEdgeInsets(top: 0, left: 12, bottom: 12, right: 0)
        return collectionView.calculateCellSize(collectionViewWidth: collectionView.bounds.width, heightRatio: 0.8, insets: insets, columns: 2)
   }
}

extension MealCardTableViewCell: UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       guard let meal = meals?[indexPath.item] else { return }
       mealClicked?(meal)
   }
}
