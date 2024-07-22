//
//  MealsListInteractor.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 21/07/24.
//

import Foundation

protocol MealListInteractable: AnyObject {
    func getMealCategories() async -> MealCategoriesEntity
}

class MealsListInteractor: MealListInteractable {
    func getMealCategories() async -> MealCategoriesEntity {
        if let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                print(String(data: data, encoding: .utf8) ?? "")
                let categories = try JSONDecoder().decode(MealCategoriesEntity.self, from: data)
                return categories
            } catch {
                print("Error getting meal categories: \(error)")
            }
        }
        return MealCategoriesEntity(mealCategories: [])
    }
}

class MealsListInteractorMock: MealListInteractable {
    func getMealCategories() async -> MealCategoriesEntity {
        return MealCategoriesEntity(mealCategories: [
            MealCategoryEntity(categoryMealType: "Random type 1", categoryMealImage: "image", categoryMealId: "\(UUID().uuidString)", categoryMealDescription: "Description"),
            MealCategoryEntity(categoryMealType: "Random type 2", categoryMealImage: "image", categoryMealId: "\(UUID().uuidString)", categoryMealDescription: "Description"),
            MealCategoryEntity(categoryMealType: "Random type 3", categoryMealImage: "image", categoryMealId: "\(UUID().uuidString)", categoryMealDescription: "Description"),
        ])
    }
}
