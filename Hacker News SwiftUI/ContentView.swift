//
//  ContentView.swift
//  Hacker News SwiftUI
//
//  Created by Ryan Henzell-Hill on 25/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(posts) { post in
                return Text(post.title)
            }
            .navigationTitle("Hacker News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Bonjour"),
    Post(id: "3", title: "Hola")
]
