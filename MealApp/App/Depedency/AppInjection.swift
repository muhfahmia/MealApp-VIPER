//
//  AppInjection.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation

protocol Injection: HomeInjection, DetailInjection {}

class AppInjection: Injection {}
