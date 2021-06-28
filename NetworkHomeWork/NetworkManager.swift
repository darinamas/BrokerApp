//
//  NetworkManager.swift
//  NetworkHomeWork
//
//  Created by Daryna Polevyk on 17.06.2021.
//

import Foundation

class NetworkManager {
    //var dictFromST: [keyForTuple: Any?]?

    
    func get(complitionHandler: @escaping ([ModelTypeForDecode]) -> ()) {
        let task = URLSession.shared.dataTask(with: URL(string: "https://quotes.instaforex.com/api/quotesTick")!) { data, response, error in

            do {
                let json = try JSONDecoder().decode([ModelTypeForDecode].self, from: data!) 
                complitionHandler(json) //!!
        
            } catch {
                print("Error")
            }

            
        }
        task.resume()
    }
}
