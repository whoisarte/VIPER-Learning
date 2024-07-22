//
//  MealsListRouter.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 21/07/24.
//

import Foundation
import UIKit

class MealsListRouter {
    func showMealsCategoryListScreen(window: UIWindow?) {
        let interactor = MealsListInteractor()
        let presenter = MealsListPresenter(interactor: interactor, mapper: MealCategoryMapper())
        let view = MealsListScreen(presenter: presenter)
        presenter.listDelegate = view
        let navigationController = UINavigationController(rootViewController: view)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
