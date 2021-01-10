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
        print(self.queryModel.dishQueries)
    }
    
    func addIngredient(ing: String) {
        self.queryModel.addIngredient(ing: ing)
    }
    
    func getDishArray() -> Array<Dish> {
        return self.queryModel.getDishArray()
    }
    
    func getIngArray() -> Array<Ingredient> {
        return self.queryModel.getIngArray()
    }
}
