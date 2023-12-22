//
//  HomePresenter.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation

protocol HomePresenter {
    var view: HomeViewInterface? { get set }
    var presenter: HomePresenter? { get set }
    var interactor: HomeInteractor? { get set }
    var meals: [Meal] { get set }
    func viewDidLoad()
    func successFetchMealByCategories(meals: [Meal])
}

class DefaultHomePresenter: HomePresenter {
    var view: HomeViewInterface?
    
    var presenter: HomePresenter?
    
    var interactor: HomeInteractor?
    
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
    
}
