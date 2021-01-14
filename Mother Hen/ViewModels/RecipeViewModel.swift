//
//  RecipeViewModel.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import Foundation


class RecipeViewModel : ObservableObject {
    @Published var queryModel: Query
    @Published var recipeModel: SearchResults
    
    //@Published var userRecipes = UserSettings()
    
    init () {
        self.queryModel = Query()
        self.recipeModel = SearchResults()
    }
    
    // update the userRecipes
    func toggleRecipe(index: Int) {
        self.recipeModel.toggleRecipe(index: index)
    }
    
    // for recipes
    func search() {
        //var urls = self.queryModel.generateURLS()
        let completion = { (result: APIResult) -> APIResult in
            return result
        }
        
        self.recipeModel.clearRecipes()
        
        self.queryModel.search() {(result) in
            self.recipeModel.populateRecipes(input: result)
        }
    }
    
    func getRecipeArray() -> Array<Recipe> {
        return self.recipeModel.getRecipeArray()
    }
    
    // for search queries
    func addDish(dish: String) {
        self.queryModel.addDish(dish: dish)
        //print(self.queryModel.dishQueries)
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
    
    func editDish(index: Int, edit: String) {
        self.queryModel.editDish(index: index, edit: edit)
        //print("reaached view model")
    }
    
    func getDishIndex(dish: Dish) -> Int {
        return self.queryModel.getDishIndex(dish: dish)
    }
    
    func getDishName(index: Int) -> String {
        return self.queryModel.getDishName(index: index)
    }
    
    func removeDish(index: Int) {
        self.queryModel.removeDish(index: index)
    }
    
    func editIngredient(index: Int, edit: String) {
        self.queryModel.editIngredient(index: index, edit: edit)
    }
    
    func getIngIndex(ing: Ingredient) -> Int {
        return self.queryModel.getIngIndex(ing: ing)
    }
    
    func getIngName(index: Int) -> String {
        return self.queryModel.getIngName(index: index)
    }
    
    func removeIng(index: Int) {
        self.queryModel.removeIng(index: index)
    }
    
    func toggleDish(index: Int) {
        self.queryModel.toggleDish(index: index)
    }
    
    func toggleIngredient(index: Int) {
        self.queryModel.toggleIngredient(index: index)
    }
}
