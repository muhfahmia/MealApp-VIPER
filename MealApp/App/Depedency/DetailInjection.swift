//
//  DetailInjection.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation

protocol DetailInjection {
    func resolve(meal: Meal) -> DetailViewController
    func resolve() -> DetailRouter
}

extension DetailInjection where Self: Injection {
    func resolve(meal: Meal) -> DetailViewController {
        return DetailViewController(meal: meal)
    }
    
    func resolve() -> DetailRouter {
        return DefaultDetailRouter(injection: self)
    }
}
