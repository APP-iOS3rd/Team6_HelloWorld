//
//  HealthDetail.swift
//  My_Recipe
//
//  Created by YOU on 11/3/23.
//

import SwiftUI

struct HealthDetail: View {
    
    let seletedRecipes : Recipe
    
    var body: some View {
        Form{
            Section(header: Text("receipe Detail")){
                Image(seletedRecipes.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(seletedRecipes.name)
                    .font(.headline)
                    .foregroundStyle(Color.kaleGreen)
                Text(seletedRecipes.ingredient)
                    .font(.body)
                Text(seletedRecipes.cookingOrder)
                    .font(.body)
            }
        }
    }
}

#Preview {
    HealthDetail(seletedRecipes: .init(id: "", name: "", ingredient: "", cookingOrder: "", imageName: "food1"))
}
