//
//  DetailViewController.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import UIKit
import SDWebImage

protocol DetailViewInterface {
    func updateSuccessDetail(meal: Meal)
}

class DetailViewController: UIViewController, DetailViewInterface {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var mealInstruction: UILabel!
    
    var presenter: DetailPresenter?
    
    init(meal: Meal) {
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateSuccessDetail(meal: Meal) {
        mealImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        mealImage.sd_setImage(with: URL(string: meal.imageUrl ?? ""))
        mealTitle.text = meal.name
        mealInstruction.lineBreakMode = .byWordWrapping
        let txtIns = meal.instructions?.replacingOccurrences(of: "/r/n", with: "\n")
        mealInstruction.text = txtIns
    }
}
