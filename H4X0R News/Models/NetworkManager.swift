//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Muzammil Muneer on 07/04/2020.
//  Copyright © 2020 Muzammil Muneer. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchDate() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task =  session.dataTask(with: url) { (data, response, error) in
                if let e = error{
                    print(e)
                } else {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                       
                    }
                    
                }
            }
            
            task.resume()
        }
    }
}
