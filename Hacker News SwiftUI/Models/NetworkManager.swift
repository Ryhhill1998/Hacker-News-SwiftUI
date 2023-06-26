//
//  NetworkManager.swift
//  Hacker News SwiftUI
//
//  Created by Ryan Henzell-Hill on 26/06/2023.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) {(data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let safeData = data else { return }
            guard let results = self.parseData(for: safeData) else { return }
            
            DispatchQueue.main.async {
                self.posts = results.hits
            }
        }
        
        task.resume()
    }
    
    func parseData(for data: Data) -> Results? {
        var results: Results?
        let decoder = JSONDecoder()
        
        do {
            results = try decoder.decode(Results.self, from: data)
        } catch {
            print(error)
        }
        
        return results
    }
}
