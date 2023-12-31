//
//  HomeInjection.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation

protocol HomeInjection {
    func resolve() -> HomeViewController
    func resolve() -> HomePresenter
    func resolve() -> HomeInteractor
    func resolve() -> HomeRouter
    func resolve() -> MealDataSource
    func resolve() -> MealRepository
    func resolve() -> MealByCategoriesUseCase
    func resolve() -> MealCategoriesUseCase
}

extension HomeInjection where Self: Injection {
    
    func resolve() -> HomeViewController {
        let vc = HomeViewController()
        let presenter: HomePresenter = resolve()
        let interactor: HomeInteractor = resolve()
        let router: HomeRouter = resolve()
        vc.presenter = presenter
        vc.presenter?.interactor = interactor
        vc.presenter?.router = router
        vc.presenter?.view = vc
        vc.presenter?.interactor?.presenter = presenter
        return vc
    }
    
    func resolve() -> HomePresenter {
        return DefaultHomePresenter()
    }
    
    func resolve() -> HomeInteractor {
        return DefaultHomeInteractor(mealByCategoriesUseCase: resolve(), mealCategoriesUseCase: resolve())
    }
    
    func resolve() -> HomeRouter {
        return DefaultHomeRouter(injection: self)
    }
    
    func resolve() -> MealDataSource {
        return DefaultMealDataSource()
    }
    
    func resolve() -> MealRepository {
        return DefaultMealRepository(dataSource: resolve())
    }
    
    func resolve() -> MealByCategoriesUseCase {
        return MealByCategoriesInteractor(repository: resolve())
    }
    
    func resolve() -> MealCategoriesUseCase {
        return MealCategoriesInteractor(repository: resolve())
    }
    
}
