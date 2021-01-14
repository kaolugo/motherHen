//
//  UserSettings.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/13/21.
//

import Foundation
import Combine


class UserSettings : ObservableObject {
    @Published var userRecipes : [Recipe] {
        didSet {
            UserDefaults.standard.set(userRecipes, forKey: "userRecipes")
        }
    }
    
    
    init () {
        self.userRecipes = UserDefaults.standard.object(forKey: "userRecipes") as? [Recipe] ?? [Recipe]()
    }
    
    /*
    func getUserArray() -> [Recipe] {
        return UserDefaults.standard.array(forKey: "userRecipes") ?? [Recipe]
    }
 */
}
