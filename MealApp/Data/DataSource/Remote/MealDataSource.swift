//
//  MealDataSource.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import RxSwift

protocol MealDataSource {
    func list(category: String) -> Observable<[Meal]>
}

struct DefaultMealDataSource: MealDataSource {
    func list(category: String) -> Observable<[Meal]> {
        return APIManager.shared.request(MealAPI.listMeals(category: category).endpoint, response: Meals.self)
            .compactMap { $0.meals }
    }
}
