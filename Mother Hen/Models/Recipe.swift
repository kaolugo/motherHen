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
    var rawAPIResults : [APIResult]
    
    
    init() {
        searchResults = []
        rawAPIResults = []
    }
    
    mutating func populateRecipes(input : [APIResult]) {
        
        rawAPIResults = input
        
        for i in 0 ..< rawAPIResults.count {
            for j in 0 ..< rawAPIResults[i].results.count {
                searchResults.append(rawAPIResults[i].results[j])
            }
        }

        print(searchResults)
    }
    
    func getRecipeArray() -> Array<Recipe> {
        print(searchResults)
        return self.searchResults
    }
}
