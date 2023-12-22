//
//  HomePresenter.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import UIKit

protocol HomePresenter {
    var view: HomeViewInterface? { get set }
    var presenter: HomePresenter? { get set }
    var interactor: HomeInteractor? { get set }
    var router: HomeRouter? { get set }
    var meals: [Meal] { get set }
    func viewDidLoad()
    func successFetchMealByCategories(meals: [Meal])
    func routeToDetail(vc: UIViewController, meal: Meal)
}

class DefaultHomePresenter: HomePresenter {
    var view: HomeViewInterface?
    
    var presenter: HomePresenter?
    
    var interactor: HomeInteractor?
    
    var router: HomeRouter?
    
    var meals: [Meal] = []
    
    init() {
    }
    
    func viewDidLoad() {
        interactor?.getMealByCategories(categories: "Beef")
    }
    
    func successFetchMealByCategories(meals: [Meal]) {
        self.meals = meals
        view?.updateSuccess()
    }
    
    func routeToDetail(vc: UIViewController, meal: Meal) {
        router?.routeToDetail(vc: vc, meal: meal)
    }
    
}
