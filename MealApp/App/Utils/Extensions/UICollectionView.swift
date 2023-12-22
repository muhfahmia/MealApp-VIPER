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
    
    func getResponsiveGrid(estimatedWidth: CGFloat, heightRatio: CGFloat, grid: CGFloat) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let deviceModel = UIDevice.current.model
        var estimatedWidth = estimatedWidth
        if deviceModel == "iPad" {
            estimatedWidth = estimatedWidth - 0.35
        }
        let cellWidth = (screenWidth * estimatedWidth) - (grid - 1) / grid
        let cellHeight = cellWidth * heightRatio
        let size = CGSize(width: cellWidth, height: cellHeight)
        return size
    }
    
}
