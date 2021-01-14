//
//  Recipe.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import Foundation


struct Recipe : Codable {
    public let title : String
    public let url : URL
    
    var save = false
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case url = "href"
    }
}

// raw data from recipe puppy
struct APIResult : Codable {
    public let results : [Recipe]
    //let results : [String]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}


struct SearchResults {
    var searchResults : [Recipe]
    //var rawAPIResults : [APIResult]
    
    
    init() {
        searchResults = []
    }
    
    mutating func clearRecipes() {
        searchResults.removeAll()
    }
    
    
    mutating func populateRecipes(input: APIResult) {
        
        //rawAPIResults = input
        for i in 0 ..< input.results.count {
            searchResults.append(input.results[i])
        }
    }
    
    func getRecipeArray() -> Array<Recipe> {
        print(searchResults)
        return self.searchResults
    }
    
    mutating func toggleRecipe(index: Int) {
        searchResults[index].save.toggle()
    }
}
