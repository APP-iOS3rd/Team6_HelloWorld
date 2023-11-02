//
//  AddNewRecipe.swift
//  HealthRecipe
//
//  Created by YOU on 11/2/23.
//

import SwiftUI

struct AddNewRecipe: View {
 //  @StateObject var foodRecipe : Recipe
    
//    @Binding var path : NavigationPath

    @State private var name :String = ""
    @State private var ingredient :String = ""
    @State private var cookingOrder :String = ""
  /* @State private var imageName : String = "" 사진첩에서 받아와야함*/
    
    var body: some View {
        Form{
            Section{
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .opacity(0.5)
                
                
                
                
            }header: {
                Text("Food Recipe")
            }
        }
        Button{
            addNewFoodRecipe()
        }label:{
            Text("Add Recipe")
        }
    }
    func addNewFoodRecipe() {
        let newRecipe = Recipe(id:UUID(), name:name,ingredient: ingredient,cookingOrder:cookingOrder ,imageName:"food1")
        
        
    }
}

#Preview {
    AddNewRecipe()
}
