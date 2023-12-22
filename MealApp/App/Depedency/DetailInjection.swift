//
//  DetailInjection.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation

protocol DetailInjection {
    func resolve() -> DetailViewController
    func resolve() -> DetailRouter
}

extension DetailInjection where Self: Injection {
    func resolve() -> DetailViewController {
        return DetailViewController()
    }
    
    func resolve() -> DetailRouter {
        return DefaultDetailRouter(injection: self)
    }
}
