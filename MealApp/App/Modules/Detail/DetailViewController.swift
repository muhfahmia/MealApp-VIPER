//
//  DetailViewController.swift
//  MealApp
//
//  Created by Muhammad Fahmi on 22/12/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
