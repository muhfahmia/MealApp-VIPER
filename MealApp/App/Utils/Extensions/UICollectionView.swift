//
//  UICollectionView.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
    
    func register<T: UICollectionViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
    }

    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    func calculateCellSize(collectionViewWidth: CGFloat, heightRatio: CGFloat, insets: UIEdgeInsets, columns: Int) -> CGSize {
        let totalSpacing = CGFloat(columns - 1)
        let availableWidth = collectionViewWidth - insets.left - insets.right - totalSpacing
        let cellWidth = availableWidth / CGFloat(columns)

        // Calculate cell height based on aspect ratio or other criteria
        let cellHeight = cellWidth * heightRatio// Adjust as needed
//        print("CL Width: \(collectionViewWidth)")
//        print("Available width: \(availableWidth)")
//        print("insets: \(insets)")

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
