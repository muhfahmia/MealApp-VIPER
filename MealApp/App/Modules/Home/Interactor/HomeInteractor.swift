//
//  HomeInteractor.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import RxSwift

protocol HomeInteractor {
    var presenter: HomePresenter? { get set }
    func getMealByCategories(categories: String)
}

class DefaultHomeInteractor: HomeInteractor {
    
    var presenter: HomePresenter?
    let mealByCategoriesUseCase: MealByCategoriesUseCase
    let dispose = DisposeBag()
    
    init(mealByCategoriesUseCase: MealByCategoriesUseCase) {
        self.mealByCategoriesUseCase = mealByCategoriesUseCase
    }
    
    func getMealByCategories(categories: String) {
        mealByCategoriesUseCase.execute(categories: categories)
            .subscribe(onNext: { [weak self] meals in
                self?.presenter?.successFetchMealByCategories(meals: meals)
            }, onError: { error in
                print("Error:", error)
            }).disposed(by: dispose)
    }
    
}
