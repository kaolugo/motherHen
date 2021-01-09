//
//  RecipeViewModel.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import Foundation


class RecipeViewModel : ObservableObject {
    @Published var queryModel: Query
    
    init () {
        self.queryModel = Query()
    }
    
    func addDish(dish: String) {
        self.queryModel.addDish(dish: dish)
    }
    
    func addIngredient(ing: String) {
        self.queryModel.addIngredient(ing: ing)
    }
}
