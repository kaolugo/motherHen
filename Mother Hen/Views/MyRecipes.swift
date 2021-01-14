//
//  MyRecipes.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/13/21.
//

import SwiftUI


struct ToggleSavedRecipe : View {
    @State var didTap : Bool
    @State var index : Int
    
    @StateObject var recipeViewModel : RecipeViewModel
    //@StateObject var
    
    var body : some View {
        Button(action: {
            self.recipeViewModel.toggleSavedRecipe(index: index)
            self.didTap.toggle()
            
        }, label: {
            Image(systemName: didTap ? "heart.fill" : "heart")
                .font(.system(size: 25, weight: .regular))
                .foregroundColor(didTap ? Color("heart") : Color("slate"))
        })
        .padding(.horizontal, 10)
        .padding(.vertical, 35)
    }
    
}


struct SavedRecipe : View {
    var recipe: Recipe
    
    //@Binding var show : Bool
    var show: Bool
    var index: Int
    //@Binding var index : Int
    
    @StateObject var recipeViewModel: RecipeViewModel
    
    var body : some View {
        ZStack {
            HStack {
                
                Link(recipe.title, destination: recipe.url)
                    .frame(height: 50)
                    .font(.custom("Montserrat-Regular", size: 20))
                    .foregroundColor(Color("coffee"))
                    //.padding(.vertical, )
                
                Spacer()
                
                ToggleSavedRecipe(didTap: show, index: index, recipeViewModel: recipeViewModel)
                /*
                Button(action: {print("implement like function")}, label: {
                    Image(systemName: "heart")
                        .font(.system(size: 25, weight: .regular))
                        .foregroundColor(Color("slate"))
                })
 */
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 35)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        //.padding(.top, 10)
        )
    }
}




struct recipeScroll : View {
    @StateObject var recipeViewModel : RecipeViewModel
    
    //@Binding var showEdit : Bool
    
    //@Binding var index : Int
    
    var body : some View {
        ScrollView(.vertical) {
            VStack {
                //var userArray = UserDefaults.standard.array(forKey: "userRecipes")
                var userArray = self.recipeViewModel.getSaveData()
                
                ForEach(0 ..< userArray.count, id: \.self) {
                    recipe in
                    SavedRecipe(recipe: userArray[recipe], show: userArray[recipe].save, index: recipe, recipeViewModel: recipeViewModel)
                    //RecipeResult(recipe: userArray[recipe], show: userArray[recipe].save, index: $index, recipeViewModel: recipeViewModel)
                }
            }
        }
    }
}

struct MyRecipes: View {
    @ObservedObject var recipeViewModel : RecipeViewModel
    @ObservedObject var userRecipes = UserSettings()
    
    @Binding var showRecipes : Bool
    @Binding var showSearch : Bool
    @Binding var showResults : Bool
    
    //@State private var showRecipe = false
    //@State private var showRecipeIndex = 0
    
    var body : some View {
        ZStack {
            // background
            Color("creme").opacity(1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("My Recipes")
                        .font(.custom("Typo Round Regular Demo", size: 45))
                        .foregroundColor(Color("coffee"))
                    
                    Spacer()
                }
                
                
                recipeScroll(recipeViewModel: recipeViewModel)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            VStack {
                Spacer()
                //NavBar(showSearch: showSearch, showRecipes: showRecipes, showResults: showResults)
                HStack {
                    // search tab
                    Button(action: {
                        self.recipeViewModel.clearRecipes()
                        if showRecipes {
                            self.showRecipes.toggle()
                        }
                        
                        if !showSearch {
                            self.showSearch.toggle()

                        }
                        
                        if showResults {
                            self.showResults.toggle()
                        }
                                        
                        //self.showResults.
                    }, label: {
                        VStack {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                            Text("search")
                                .font(.custom("Montserrat-Regular", size: 10))
                                .foregroundColor(.white)
                        }
                    })
                    .padding(.leading, 80)
                    .padding(.bottom, 25)
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    
                    // my recipes tab
                    Button(action: {
                        self.recipeViewModel.clearRecipes()
                        if showSearch {
                            self.showSearch.toggle()
                        }
                        
                        if !showRecipes {
                            self.showRecipes.toggle()
                        }
                        
                        if showResults {
                            self.showResults.toggle()
                        }
                        
                        
                    }, label: {
                        VStack {
                            Image(systemName: "book")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                            Text("my recipes")
                                .font(.custom("Montserrat-Regular", size: 10))
                                .foregroundColor(.white)
                        }
                    })
                    .padding(.trailing, 80)
                    .padding(.bottom, 25)
                    .padding(.top, 5)
                }
                .frame(maxWidth: .infinity)
                .background(
                    Rectangle().foregroundColor(Color("copper"))
                )
                .padding(.bottom, -50)
            
                
                
            }
        }
    }
    
}

/*
struct MyRecipes_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipes(recipeViewModel: RecipeViewModel())
    }
}
 */
