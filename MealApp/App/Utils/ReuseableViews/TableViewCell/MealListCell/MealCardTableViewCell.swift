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
   
   var cardSizeContent: CGSize?
   
    var mealClicked: ((Meal) -> Void)?
   
   
    override func awakeFromNib() {
       super.awakeFromNib()
        cardSizeContent = mealsCardCL.getResponsiveGrid(estimatedWidth: 0.45, heightRatio: 1, grid: 2)
       setupUI()
   }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
   }
   
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
       self.layoutIfNeeded()
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
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
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 12
   }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 0
   }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
   }
}

extension MealCardTableViewCell: UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       guard let meal = meals?[indexPath.item] else { return }
       mealClicked?(meal)
   }
}
