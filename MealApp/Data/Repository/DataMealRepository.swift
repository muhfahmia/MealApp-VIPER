//
//  MealRepository.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 23/12/23.
//

import Foundation
import RxSwift

struct DefaultMealRepository: MealRepository {
    
    let dataSource: MealDataSource
    
    func list(categories: String) -> Observable<[Meal]> {
        dataSource.list(category: categories)
    }
    
    func detail(id: String) -> Observable<Meal> {
        dataSource.detail(id: id)
    }
    
    func categories() -> Observable<[MealCategory]> {
        dataSource.categories()
    }
    
}
