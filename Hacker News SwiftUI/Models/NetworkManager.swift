//
//  NetworkManager.swift
//  Hacker News SwiftUI
//
//  Created by Ryan Henzell-Hill on 26/06/2023.
//

import Foundation

class NetworkManager {
    
    func fetchData() {
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) {(data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let safeData = data else { return }
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(Results.self, from: safeData)
                let hits = decodedData.hits
                print(hits[0].title)
                print(hits[0].points)
                print(hits[0].url)
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
