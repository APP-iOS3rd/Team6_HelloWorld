//
//  RecipeStore.swift
//  HealthRecipe
//
//  Created by 최준현 on 11/2/23.
//

import Foundation

class RecipeStore: ObservableObject{
    @Published var recipes: [Recipe]
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
}
