//
//  HomeRouter.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import UIKit

protocol HomeRouter {
    func routeToHome(window: UIWindow?)
    func routeToDetail(vc: UIViewController, meal: Meal)
}

class DefaultHomeRouter: HomeRouter {
    
    let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    
    func routeToHome(window: UIWindow?) {
        let vc: HomeViewController = injection.resolve()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
    
    func routeToDetail(vc: UIViewController, meal: Meal) {
        let detailVC: DetailRouter = injection.resolve()
        detailVC.routeToDetail(vc: vc, meal: meal)
    }
    
}
