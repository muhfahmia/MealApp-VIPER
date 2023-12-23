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
    var categories: [MealCategory] { get set }
    func viewDidLoad()
    func getMealByCategory(category: String)
    func successFetchMealByCategories(meals: [Meal])
    func successFetchMealCategories(categories: [MealCategory])
    func routeToDetail(vc: UIViewController, meal: Meal)
}

class DefaultHomePresenter: HomePresenter {
    var view: HomeViewInterface?
    var presenter: HomePresenter?
    var interactor: HomeInteractor?
    var router: HomeRouter?
    
    var meals: [Meal] = []
    var categories: [MealCategory] = []
    
    init() {
    }
    
    func viewDidLoad() {
        interactor?.getMealByCategories(categories: "Seafood")
        interactor?.getMealCategories()
    }
    
    func getMealByCategory(category: String) {
        interactor?.getMealByCategories(categories: category)
    }
    
    func successFetchMealByCategories(meals: [Meal]) {
        self.meals = meals
        view?.updateSuccess(section: 1)
    }
    
    func successFetchMealCategories(categories: [MealCategory]) {
        self.categories = categories
        view?.updateSuccess(section: 0)
    }
    
    func routeToDetail(vc: UIViewController, meal: Meal) {
        router?.routeToDetail(vc: vc, meal: meal)
    }
    
}
