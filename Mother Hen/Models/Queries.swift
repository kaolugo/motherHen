//
//  Queries.swift
//  Mother Hen
//
//  The queries class handles the logic and data associated with the search queries that the user inputs in the "Search" view
//  The two objects declared here are "Dish" and "Ingredient"
//
//  Created by Kaoru Murai on 1/8/21.
//

import Foundation


// Dish that the user would like to cook
struct Dish : Decodable, Equatable {
    var name: String
    var toggle: Bool
    //var id = UUID()
    
    init (name: String) {
        self.name = name
        self.toggle = true
    }
}


// Ingredient that is available to the user
struct Ingredient : Decodable, Equatable {
    var name: String
    var toggle: Bool
    
    init (name: String) {
        self.name = name
        self.toggle = true
    }
}


struct Query {
    // list of dishes that the user would like to make
    var dishQueries: [Dish]

    // list of ingredients that the user has available
    var ingQueries: [Ingredient]
    
    
    
    init() {
        dishQueries = []
        
        ingQueries = []
    }
    
    // adds new dish to the list of queries
    mutating func addDish (dish: String) {
        //dish = dish.lowercased()
        self.dishQueries.append(Dish(name: dish.lowercased()))
    }
    
    // adds new ingredient to the list of queries
    mutating func addIngredient (ing: String) {
        //ing = ing.lowercased()
        self.ingQueries.append(Ingredient(name: ing.lowercased()))
    }
    
    func getDishArray () -> [Dish] {
        return self.dishQueries
    }
    
    func getIngArray() -> [Ingredient] {
        return self.ingQueries
    }
    
    mutating func editDish (index: Int, edit: String) {
        //let target = self.dishQueries.firstIndex(of: dish)
        self.dishQueries[index].name = edit.lowercased()
    }
    
    func getDishIndex(dish: Dish) -> Int {
        return self.dishQueries.firstIndex(of: dish)!
    }
    
    func getDishName(index: Int) -> String {
        return self.dishQueries[index].name
    }
    
    mutating func removeDish(index: Int) {
        self.dishQueries.remove(at: index)
    }
    
    mutating func editIngredient(index: Int, edit: String) {
        self.ingQueries[index].name = edit.lowercased()
    }
    
    func getIngIndex(ing: Ingredient) -> Int {
        return self.ingQueries.firstIndex(of: ing)!
    }
    
    func getIngName(index: Int) -> String {
        return self.ingQueries[index].name
    }
    
    mutating func removeIng(index: Int) {
        self.ingQueries.remove(at: index)
        print("removal")
        print(ingQueries)
    }
}

