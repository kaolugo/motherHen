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
}


// Ingredient that is available to the user
struct Ingredient : Decodable {
  var name: String
  var toggle: Bool
}
