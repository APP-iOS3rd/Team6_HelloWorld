

import SwiftUI

struct AddNewRecipe: View {
   @StateObject var recipeStore : RecipeStore
    
    @Binding var path : NavigationPath

    @State private var name :String = ""
    @State private var ingredient :String = ""
    @State private var cookingOrder :String = ""
   @State private var imageName : String = "" //사진첩에서 받아와야함
    
    var body: some View {
        Form{
            Section{
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .opacity(0.5)
                
                
                VStack(alignment: .leading) {
                    FoodInput(foodTitle: "요리 이름", userInput: $name)
                    FoodInput(foodTitle: "재료", userInput: $ingredient)
                    FoodInput(foodTitle: "조리 방법", userInput: $cookingOrder)
                }
                
                
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
        let newRecipe = Recipe(id:UUID().uuidString, name: name, ingredient: ingredient, cookingOrder:cookingOrder ,imageName: "food1")
    
    
        recipeStore.recipes.append(newRecipe)
    
        path.removeLast()

    }
}

//새로운 레시피 상세 정보 입력을 위한 뷰

struct FoodInput : View {
    var foodTitle : String
  
    @Binding var userInput:String
    
    var body: some View {
        VStack{
            Text(foodTitle)
                .font(.headline)
            TextField("Enter \(foodTitle)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}


//
//#Preview {
//    AddNewRecipe(recipeStore: RecipeStore(), path: <#Binding<NavigationPath>#>)
//}
