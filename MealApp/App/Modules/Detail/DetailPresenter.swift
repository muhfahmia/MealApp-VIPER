//
//  DetailPresenter.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation

protocol DetailPresenter {
    var view: DetailViewInterface? { get set }
    var presenter: DetailPresenter? { get set }
    var interactor: DetailInteractor? { get set }
    var meal: Meal? { get set }
    func viewDidLoad()
    func successGetMeal(meal: Meal)
}

class DefaultDetailPresenter: DetailPresenter {
    var view: DetailViewInterface?
    
    var presenter: DetailPresenter?
    
    var interactor: DetailInteractor?
    
    var meal: Meal?
    
    init() {}
    
    func viewDidLoad() {
        interactor?.getMealDetail(meal: self.meal!)
    }
    
    func successGetMeal(meal: Meal) {
        view?.updateSuccessDetail(meal: meal)
    }
    
}
