//
//  MealRepository.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import RxSwift

protocol MealRepository {
    func list(categories: String) -> Observable<[Meal]>
}

struct DefaultMealRepository: MealRepository {
    
    let dataSource: MealDataSource
    
    func list(categories: String) -> Observable<[Meal]> {
        dataSource.list(category: categories)
    }
    
}
