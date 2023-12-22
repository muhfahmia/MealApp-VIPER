//
//  MealResponse.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import ObjectMapper

extension Meal: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        idMeal      <- map["idMeal"]
        name        <- map["strMeal"]
        imageUrl    <- map["strMealThumb"]
    }
}

extension Meals: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        meals   <- map["meals"]
    }
    
}
