//
//  MealByCategoriesUseCase.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import RxSwift

protocol MealByCategoriesUseCase {
    func execute(categories: String) -> Observable<[Meal]>
}

struct MealByCategoriesInteractor: MealByCategoriesUseCase {
    
    let repository: MealRepository
    
    func execute(categories: String) -> Observable<[Meal]> {
        repository.list(categories: categories)
    }
    
}
