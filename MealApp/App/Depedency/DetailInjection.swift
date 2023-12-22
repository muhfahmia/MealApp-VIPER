//
//  DetailInjection.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation

protocol DetailInjection {
    func resolve(meal: Meal) -> DetailViewController
    func resolve() -> DetailPresenter
    func resolve() -> MealDetailUseCase
    func resolve() -> DetailInteractor
    func resolve() -> DetailRouter
}

extension DetailInjection where Self: Injection {
    func resolve(meal: Meal) -> DetailViewController {
        let detailVC: DetailViewController = DetailViewController(meal: meal)
        var presenter: DetailPresenter = resolve()
        presenter.meal = meal
        let interactor: DetailInteractor = resolve()
        detailVC.presenter = presenter
        detailVC.presenter?.view = detailVC
        detailVC.presenter?.interactor = interactor
        detailVC.presenter?.interactor?.presenter = presenter
        return detailVC
    }
    
    func resolve() -> DetailPresenter {
        return DefaultDetailPresenter()
    }
    
    func resolve() -> DetailInteractor {
        return DefaultDetailInteractor(detailUseCase: resolve())
    }
    
    func resolve() -> DetailRouter {
        return DefaultDetailRouter(injection: self)
    }
    
    func resolve() -> MealDetailUseCase {
        return MealDetailInteractor(repository: resolve())
    }
}
