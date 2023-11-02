//
//  HealthDetail.swift
//  HealthRecipe
//
//  Created by 정다산 on 11/2/23.
//

import SwiftUI

struct HealthDetail: View {
    
    let seletedRecipes : Recipe
    
    
    var body: some View {
        Form{
            Section(header: Text("receipe Detail")){
                Image(systemName: seletedRecipes.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(seletedRecipes.name)
                    .font(.headline)
                Text(seletedRecipes.ingredient)
                    .font(.body)
                Text(seletedRecipes.cookingOrder)
                    .font(.body)
                
                
                
            }
        }
        
        
    }
}

#Preview {
    HealthDetail(seletedRecipes: .init(id: "", name: "", ingredient: "", cookingOrder: "", imageName: ""))
}
