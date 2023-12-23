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
    func getMealCategories()
}

class DefaultHomeInteractor: HomeInteractor {
    
    var presenter: HomePresenter?
    let mealByCategoriesUseCase: MealByCategoriesUseCase
    let mealCategoriesUseCase: MealCategoriesUseCase
    let dispose = DisposeBag()
    
    init( mealByCategoriesUseCase: MealByCategoriesUseCase, mealCategoriesUseCase: MealCategoriesUseCase) {
        self.mealByCategoriesUseCase = mealByCategoriesUseCase
        self.mealCategoriesUseCase = mealCategoriesUseCase
    }
    
    func getMealByCategories(categories: String) {
        mealByCategoriesUseCase.execute(categories: categories)
            .subscribe(onNext: { [weak self] meals in
                self?.presenter?.successFetchMealByCategories(meals: meals)
            }, onError: { error in
                print("Error:", error)
            }).disposed(by: dispose)
    }
    
    func getMealCategories() {
        mealCategoriesUseCase.execute()
            .subscribe(onNext: { [weak self] categories in
                self?.presenter?.successFetchMealCategories(categories: categories)
            }, onError: { error in
                print("Error:", error)
            }).disposed(by: dispose)
    }
    
}
