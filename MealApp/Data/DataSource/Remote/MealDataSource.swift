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
    func detail(id: String) -> Observable<Meal>
    func categories() -> Observable<[MealCategory]>
}

struct DefaultMealDataSource: MealDataSource {
    func list(category: String) -> Observable<[Meal]> {
        return APIManager.shared.request(MealAPI.listMeals(category: category).endpoint, response: Meals.self)
            .compactMap { $0.meals }
    }
    
    func detail(id: String) -> Observable<Meal> {
        return APIManager.shared.request(MealAPI.mealDetail(withID: id).endpoint, response: Meals.self)
            .compactMap { $0.meals?.first }
    }
    
    func categories() -> Observable<[MealCategory]> {
        return APIManager.shared.request(MealAPI.listCategories.endpoint, response: MealCategories.self)
            .compactMap { $0.categories }
        
    }
}
