//
//  ViewController.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 21/12/23.
//

import UIKit
import RxSwift

protocol HomeViewInterface {
    func updateSuccess()
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeViewInterface {

    @IBOutlet weak var tblView: UITableView!
    
    enum TableSection: Int, CaseIterable {
        case listMeal
    }
    
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
        presenter?.viewDidLoad()
    }
    
    private func setupTblView() {
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(nibWithCellClass: MealCardTableViewCell.self)
    }
    
    func updateSuccess() {
        tblView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = TableSection(rawValue: section)
        switch section {
        case .listMeal:
            return 1
        case .none:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableSection(rawValue: indexPath.section)
        switch section {
        case .listMeal:
            let cell: MealCardTableViewCell = tableView.dequeueReusableCell(withClass: MealCardTableViewCell.self, for: indexPath)
            cell.configure(with: presenter?.meals ?? [])
            cell.mealClicked = { [weak self] meal in
                self?.presenter?.routeToDetail(vc: self!, meal: meal)
            }
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

