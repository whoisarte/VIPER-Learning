//
//  MealCategoryEntity.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 21/07/24.
//

import Foundation

struct MealCategoryEntity: Codable {
    var categoryMealType: String
    var categoryMealImage: String
    var categoryMealId: String
    var categoryMealDescription: String
    
    enum CodingKeys: String, CodingKey {
        case categoryMealType = "strCategory"
        case categoryMealImage = "strCategoryThumb"
        case categoryMealId = "idCategory"
        case categoryMealDescription = "strCategoryDescription"
    }
}

