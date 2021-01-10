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
struct Dish : Decodable {
    var name: String
    var toggle: Bool
    //var id = UUID()
    
    init (name: String) {
        self.name = name
        self.toggle = true
    }
}


// Ingredient that is available to the user
struct Ingredient : Decodable {
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
        self.dishQueries.append(Dish(name: dish))
    }
    
    // adds new ingredient to the list of queries
    mutating func addIngredient (ing: String) {
        self.ingQueries.append(Ingredient(name: ing))
    }
    
    func getDishArray () -> [Dish] {
        return self.dishQueries
    }
    
    func getIngArray() -> [Ingredient] {
        return self.ingQueries
    }
    
}

