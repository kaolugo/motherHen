//
//  Results.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/10/21.
//

import SwiftUI


struct resultScroll : View {
    @StateObject var recipeViewModel : RecipeViewModel
    
    @Binding var showEdit : Bool
    
    @Binding var index : Int
    
    var body : some View {
        ScrollView(.vertical) {
            // make a scroll of search result cards
            VStack {
                let recipes = self.recipeViewModel.getRecipeArray()
                
                ForEach(0 ..< recipes.count, id: \.self) { recipe in
                    //RecipeResult(recipe: recipes[recipe])
                    RecipeResult(recipe: recipes[recipe], show: $showEdit, index: recipe, recipeViewModel: recipeViewModel)
                }
            }
        }
        .padding(.top, 5)
        .frame(height: 620)
        .frame(maxWidth: .infinity)
        //.padding()
    }
}


struct ToggleRecipe : View {
    @State private var didTap = false
    @State var index : Int
    
    @StateObject var recipeViewModel : RecipeViewModel
    //@StateObject var
    
    var body : some View {
        Button(action: {
            self.recipeViewModel.toggleRecipe(index: index)
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
 


struct RecipeResult : View {
    var recipe: Recipe
    
    @Binding var show : Bool
    //@Binding var index : Int
    var index : Int
    
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
                
                ToggleRecipe(index: index, recipeViewModel: recipeViewModel)
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


struct Results: View {
    @ObservedObject var recipeViewModel : RecipeViewModel
    @ObservedObject var userRecipes : UserSettings
    
    @Binding var showSelf : Bool
    @Binding var showOther : Bool
    @Binding var showRecipes : Bool
    
    @State private var showRecipe = false
    @State private var showRecipeIndex = 0
    
    var body: some View {
        ZStack {
            // background
            Color("creme").opacity(1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //heading
                HStack {
                    Text("Results")
                        .font(.custom("Typo Round Regular Demo", size: 45))
                        .foregroundColor(Color("coffee"))
                    Spacer()
                }
                
                //resultScroll(recipeViewModel: recipeViewModel)
                resultScroll(recipeViewModel: recipeViewModel, showEdit: $showRecipe, index: $showRecipeIndex)
                //resultScroll()
                
                Spacer()
                    .frame(height: 15)
                
                // back to search button
                Button(action: {
                    //self.recipeViewModel.search()
                    /*
                    let recipeArray = self.recipeViewModel.getRecipeArray()
                    
                    var userArray = UserDefaults.standard.array(forKey: "userRecipes")

                    
                    for i in 0 ..< recipeArray.count {
                        if recipeArray[i].save {
                            userArray?.append(recipeArray[i])
                        }
                    }
 */
                    self.recipeViewModel.clearRecipes()
                    self.showSelf.toggle()
                    self.showOther.toggle()
                }, label: {
                    Text("back to search")
                        .font(.custom("Typo Round Italic Demo", size: 30))
                        .foregroundColor(Color("coffee"))
                    
                })
                .padding(.leading, 30)
                .padding(.trailing, 25)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 8.0)
                        .foregroundColor(Color("yolk"))
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 5)
                )
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            VStack {
                Spacer()
                //NavBar(showSearch: showOther, showRecipes: showRecipes, showResults: showSelf)
                HStack {
                    // search tab
                    Button(action: {
                        self.recipeViewModel.clearRecipes()
                        if showRecipes {
                            self.showRecipes.toggle()
                        }
                        
                        if !showOther {
                            self.showOther.toggle()

                        }
                        
                        if showSelf {
                            self.showSelf.toggle()
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
                        if showOther {
                            self.showOther.toggle()
                        }
                        
                        if !showRecipes {
                            self.showRecipes.toggle()
                        }
                        
                        if showSelf {
                            self.showSelf.toggle()
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
struct ResultsPreview : PreviewProvider {
    static var previews: some View {
        Results(recipeViewModel: RecipeViewModel())
    }
}
 */
