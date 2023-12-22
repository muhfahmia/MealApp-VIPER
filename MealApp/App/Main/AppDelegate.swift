//
//  AppDelegate.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 21/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let injection = AppInjection()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let router: HomeRouter = injection.resolve()
        router.routeToHome(window: window)
        return true
    }

}

