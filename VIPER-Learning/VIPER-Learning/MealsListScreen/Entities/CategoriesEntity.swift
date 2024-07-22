//
//  MealCategoriesEntity.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 21/07/24.
//

import Foundation

struct MealCategoriesEntity: Codable {
    var mealCategories: [MealCategoryEntity]
    
    enum CodingKeys: String, CodingKey {
        case mealCategories = "categories"
    }
}
