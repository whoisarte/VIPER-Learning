//
//  MealCategoryMapper.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 22/07/24.
//

import Foundation

struct MealCategoryMapper {
    func map(entity: MealCategoryEntity) -> MealCategoryModel {
        return MealCategoryModel(categoryTitle: entity.categoryMealType,
                                 categoryDescription: entity.categoryMealDescription,
                                 categoryImage: URL(string: entity.categoryMealImage))
        
    }
}
