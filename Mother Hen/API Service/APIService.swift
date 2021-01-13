//
//  APIService.swift
//  Mother Hen
//
//  Created by Kaoru Murai on 1/8/21.
//

import Foundation


class APIService {
    public var apiResults = [APIResult]()
    
    
    func getRecipe(searchQuery: String, completion: @escaping (Result<APIResult, Error>) -> Void) {
        guard let url = URL(string: searchQuery) else {
            print("Invalid URL!");
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in if let error = error {
            completion(.failure(error.localizedDescription as! Error))
            return
        }
        
        do {
            let result = try! JSONDecoder().decode(APIResult.self, from: data!)
            completion(.success(result))
            //completion(result)
            //print(result)
        } catch let jsonError {
            completion(.failure(jsonError.localizedDescription as! Error))
        }
        
        }.resume()
        
    }
    
}


