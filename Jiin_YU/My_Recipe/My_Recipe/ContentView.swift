import SwiftUI


//데이터 로딩
//var recipeData: [Recipe] = RecipeDataLoad("recipeData.json")

struct ContentView: View {
    @StateObject var recipeStore = RecipeStore(recipes:recipeData )
    
    //메인화면 돌아가기
    @State private var stackPath = NavigationPath()

    var body: some View {

        NavigationStack (path: $stackPath) {
          
            
            List{
                
                ForEach(0..<recipeStore.recipes.count, id: \.self) { i in
                    NavigationLink(value: i ) {
                        RecipeList(recipe: recipeStore.recipes[i])
                            
                    }
                    //리스트 배경 이미지
                    //.listRowBackground(Color.semikaleGreen)
                    
                }
                
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
                
               
            }
         
           
           
            //선택한 레시피로 이동
            .navigationDestination(for: Int.self) {i in
                HealthDetail(seletedRecipes: recipeStore.recipes[i])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewRecipe(recipeStore: self.recipeStore, path: $stackPath)
            }
            .navigationTitle(
                Text("My Recipe"))
          
            
            .toolbar{
               
                ToolbarItem(placement:
                    ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(value: "Add") {
                    Text("Add")
                           
                    .foregroundStyle(Color.kaleGreen)
                    .fontWeight(.bold)
  
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    EditButton()
                    .foregroundStyle(Color.kaleGreen)
                    .fontWeight(.bold)
                    }
                
            
                    
                
                }
            
            
        }
        
        
        
    }
    
    //아이템 삭제
    func deleteItem(at offsets:IndexSet) {
        recipeStore.recipes.remove(atOffsets: offsets)
        
    }
    //아이템 이동
    func moveItem(from source:IndexSet, to destination:Int) {
        recipeStore.recipes.move(fromOffsets: source, toOffset: destination)
    }
    
    
}


#Preview {
    ContentView()
}

struct  RecipeList :View {
    
    var recipe :Recipe
    
    var body: some View {
        HStack{
            Image(recipe.imageName)

            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 90, height: 90)
            .cornerRadius(5)
            .shadow(radius: 5)
            .padding(5)
            
            Text(recipe.name)
                .foregroundStyle(Color.kaleGreen)
                .font(.headline)
        }
    }
    
}
