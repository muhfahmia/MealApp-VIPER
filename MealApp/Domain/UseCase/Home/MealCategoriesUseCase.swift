//
//  MealByCategoriesUseCase.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import RxSwift

protocol MealCategoriesUseCase {
    func execute() -> Observable<[MealCategory]>
}

struct MealCategoriesInteractor: MealCategoriesUseCase {
    
    let repository: MealRepository
    
    func execute() -> Observable<[MealCategory]> {
        repository.categories()
    }
    
}
