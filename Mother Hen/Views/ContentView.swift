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
    
    @ObservedObject var recipeViewModel : RecipeViewModel
    
    var body: some View {
        if search {
            Search(showSelf: $search, showOther: $results, recipeViewModel: recipeViewModel)
        }
        
        if results {
            // show search results view
            Results(recipeViewModel: recipeViewModel, showSelf: $results, showOther: $search)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    //@Binding var show = true
    
    static var previews: some View {
        AppContentView(recipeViewModel: RecipeViewModel())
    }
}
