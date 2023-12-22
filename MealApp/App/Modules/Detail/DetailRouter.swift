//
//  DetailRouter.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import UIKit

protocol DetailRouter {
    func routeToDetail(vc: UIViewController)
}

class DefaultDetailRouter: DetailRouter {
    
    let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func routeToDetail(vc: UIViewController) {
        let detailVC: DetailViewController = injection.resolve()
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
