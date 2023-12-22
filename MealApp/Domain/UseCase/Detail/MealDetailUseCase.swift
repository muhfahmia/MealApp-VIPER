//
//  MealByCategoriesUseCase.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import RxSwift

protocol MealDetailUseCase {
    func execute(id: String) -> Observable<Meal>
}

struct MealDetailInteractor: MealDetailUseCase {
    
    let repository: MealRepository
    
    func execute(id: String) -> Observable<Meal> {
        repository.detail(id: id)
    }
    
}
