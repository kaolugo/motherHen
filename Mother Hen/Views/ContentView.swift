//
//  ContentView.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import SwiftUI

struct AppContentView: View {
    @State var search = true
    @State var results = false
    @State var myRecipe = false
    
    @ObservedObject var recipeViewModel : RecipeViewModel
    @ObservedObject var userRecipes : UserSettings
    
    var body: some View {
        if search {
            Search(showSelf: $search, showOther: $results, showRecipes: $myRecipe, recipeViewModel: recipeViewModel)
        }
        
        if results {
            // show search results view
            Results(recipeViewModel: recipeViewModel, userRecipes: userRecipes, showSelf: $results, showOther: $search, showRecipes: $myRecipe)
        }
        
        if myRecipe {
            MyRecipes(recipeViewModel: recipeViewModel, showRecipes: $myRecipe, showSearch: $search, showResults: $results)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    //@Binding var show = true
    
    static var previews: some View {
        AppContentView(recipeViewModel: RecipeViewModel(), userRecipes: UserSettings())
    }
}
