//
//  MealsListScreen.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 21/07/24.
//

import Foundation
import UIKit

class MealsListScreen: UIViewController {
    private let presenter: MealsListPresenter
    let tableViewCategories: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CategoryMealCell.self,
                           forCellReuseIdentifier: CategoryMealCell.identifier)
        return tableView
    }()
    
    
    init(presenter: MealsListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.title = "Meal Categories"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.configureTableView()
        self.presenter.getCategoriesList()
    }
    
    func configureTableView() {
        self.view.addSubview(self.tableViewCategories)
        //self.tableViewCategories.frame = self.view.bounds
        
        NSLayoutConstraint.activate([
            self.tableViewCategories.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableViewCategories.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableViewCategories.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableViewCategories.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
        
        self.tableViewCategories.delegate = self
        self.tableViewCategories.dataSource = self
    }
}

extension MealsListScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.mealCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewCategories.dequeueReusableCell(withIdentifier: CategoryMealCell.identifier) as! CategoryMealCell
        let category = self.presenter.mealCategories[indexPath.row]
        cell.configureCell(category: category)
        return cell
    }
    
}

//MARK: Implementation of meals list categories delegation
extension MealsListScreen: ListOfMealsProtocol {
    func update(with categories: [MealCategoryModel]) {
        DispatchQueue.main.async {
            self.tableViewCategories.reloadData()
        }
    }
}
