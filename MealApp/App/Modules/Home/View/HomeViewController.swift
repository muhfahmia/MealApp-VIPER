//
//  ViewController.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 21/12/23.
//

import UIKit
import RxSwift

protocol HomeViewInterface {
    func updateSuccess(section: Int)
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeViewInterface {

    @IBOutlet weak var tblView: UITableView!
    
    enum TableSection: Int, CaseIterable {
        case listCategories
        case listMeal
    }
    
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meals"
        setupTblView()
        presenter?.viewDidLoad()
    }
    
    private func setupTblView() {
        tblView.dataSource = self
        tblView.register(nibWithCellClass: MealCardTableViewCell.self)
        tblView.register(nibWithCellClass: MealCategoriesListTableViewCell.self)
    }
    
    func updateSuccess(section: Int) {
        tblView.reloadRows(at: [IndexPath(row: 0, section: section)], with: .fade)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableSection.allCases[indexPath.section]
        
        if section == .listCategories {
            let cell: MealCategoriesListTableViewCell = tableView.dequeueReusableCell(withClass: MealCategoriesListTableViewCell.self, for: indexPath)
            cell.configure(categories: presenter?.categories ?? [])
            cell.getMealByCategory = { [weak self] category in
                self?.presenter?.getMealByCategory(category: category.category!)
            }
            return cell
        } else if section == .listMeal {
            let cell: MealCardTableViewCell = tableView.dequeueReusableCell(withClass: MealCardTableViewCell.self, for: indexPath)
            cell.configure(with: presenter?.meals ?? [])
            cell.mealClicked = { [weak self] meal in
                self?.presenter?.routeToDetail(vc: self!, meal: meal)
            }
            return cell
        }
        return UITableViewCell()
    }
}

