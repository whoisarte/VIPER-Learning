//
//  MealsListPresenter.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 21/07/24.
//

import Foundation

//MARK Protocol which allows dependency inyection
protocol MealsListPresentable: AnyObject {
    var listDelegate: ListOfMealsProtocol? { get }
    var mealCategories: [MealCategoryModel] { get }
}

protocol ListOfMealsProtocol: AnyObject {
    func update(with categories: [MealCategoryModel])
}

class MealsListPresenter: MealsListPresentable {
    private let interactor: MealListInteractable
    weak var listDelegate: ListOfMealsProtocol?
    private let mapper: MealCategoryMapper
    var mealCategories: [MealCategoryModel] = []
    
    init(interactor: MealListInteractable,
         mapper: MealCategoryMapper) {
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func getCategoriesList() {
        Task {
            let categories = await self.interactor.getMealCategories().mealCategories
            self.mealCategories = categories.map({ self.mapper.map(entity: $0) })
            self.listDelegate?.update(with: self.mealCategories)
        }
    }
}
