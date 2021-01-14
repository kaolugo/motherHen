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
    
    // list of API Results found
    //var apiResult: [APIResult]
    
    let baseURL = "http://www.recipepuppy.com/api/?i="
    
    //let API = APIService()
    
    
    //public typealias CompletionHandler = (([APIResult])->Void)?
    let completion = { (result: [APIResult]) -> [APIResult] in
        return result
    }
    
    
    init() {
        dishQueries = []
        
        ingQueries = []
        
        //results = []
        //apiResult = []
    }
    
    
    
    func generateURLS () -> [String] {
        var urls = [String]()
        
        for i in 0 ..< dishQueries.count {
            if dishQueries[i].toggle {
                
                var newDishURL = baseURL
                
                for j in 0 ..< ingQueries.count {
                    if ingQueries[j].toggle {
                        
                        // for last ingredient
                        if j == ingQueries.count - 1 {
                            newDishURL = newDishURL + ingQueries[j].name
                        }
                        else {
                            newDishURL = newDishURL + ingQueries[j].name + ","
                        }
                    }
                }
                
                newDishURL = newDishURL + "&q=" + dishQueries[i].name
                
                urls.append(newDishURL)
            }
        }
        
        return urls
    }
    
    
    func search (completion: @escaping (APIResult) ->Void) {
        var queries = generateURLS()
        
        //print(queries)
        //let API = APIService()
        //var apiResult = [APIResult]()
        
        for query in queries {
            APIService().getRecipe(searchQuery: query) { (result) in
                switch result {
                case .success(let results):
                    DispatchQueue.main.async {
                        completion(results)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
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
    }
    
    mutating func toggleDish(index: Int) {
        self.dishQueries[index].toggle.toggle()
        //print("toggled")
        //print(dishQueries)
    }
    
    mutating func toggleIngredient(index: Int) {
        self.ingQueries[index].toggle.toggle()
    }
}

