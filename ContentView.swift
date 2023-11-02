//
//  ContentView.swift
//  HealthRecipe
//
//  Created by Taejun Ha on 11/2/23.
//

import SwiftUI


struct Recipe : Codable, Identifiable {
    var id : String
    var name : String
    
    var ingredient : String
    var cookingOrder : String
    
    var imageName : String
}

// JSOM 데이터 로딩 ( loadJSON이라는 함수를 별도로 만들어야함 )
var recipeData: [Recipe] = loadJSON("recipeData.json")







#Preview {
    ContentView()
}
