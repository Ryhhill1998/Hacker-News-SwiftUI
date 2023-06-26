//
//  PostData.swift
//  Hacker News SwiftUI
//
//  Created by Ryan Henzell-Hill on 26/06/2023.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectId: String
    let title: String
    let points: Int
    let url: String
    
    var id: String {
        return objectId
    }
}
