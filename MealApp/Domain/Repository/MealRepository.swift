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
    func detail(id: String) -> Observable<Meal>
    func categories() -> Observable<[MealCategory]>
}
