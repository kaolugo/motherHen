//
//  MyRecipes.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/13/21.
//

import SwiftUI

struct recipeScroll : View {
    @StateObject var recipeViewModel : RecipeViewModel
    
    @Binding var showEdit : Bool
    
    @Binding var index : Int
    
    var body : some View {
        ScrollView(.vertical) {
            VStack {
                var userArray = UserDefaults.standard.array(forKey: "userRecipes")
                
                ForEach(0 ..< userArray!.count, id: \.self) {
                    recipe in
                    RecipeResult(recipe: userArray![recipe] as! Recipe, show: $showEdit, index: $index, recipeViewModel: recipeViewModel)
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
                
                
                //recipeScroll(recipeViewModel: recipeViewModel)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            VStack {
                Spacer()
                //NavBar(showSearch: showSearch, showRecipes: showRecipes, showResults: showResults)
                HStack {
                    // search tab
                    Button(action: {
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
