//
//  DetailInteractor.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import Foundation
import RxSwift

protocol DetailInteractor {
    var presenter: DetailPresenter? { get set }
    func getMealDetail(meal: Meal)
}

class DefaultDetailInteractor: DetailInteractor {
    var presenter: DetailPresenter?
    let detailUseCase: MealDetailUseCase
    let dispose = DisposeBag()
    
    init(detailUseCase: MealDetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func getMealDetail(meal: Meal) {
        detailUseCase.execute(id: meal.idMeal!)
            .subscribe(onNext: { [weak self] meal in
                self?.presenter?.successGetMeal(meal: meal)
            }, onError: { error in
                print("Error:", error)
            }).disposed(by: dispose)
    }
    
}
