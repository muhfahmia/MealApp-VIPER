//
//  MealResponse.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import ObjectMapper

extension MealCategory: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        category <- map["strCategory"]
    }
}

extension MealCategories: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        categories  <- map["meals"]
    }
    
}
