//
//  ContentView.swift
//  Hacker News SwiftUI
//
//  Created by Ryan Henzell-Hill on 25/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 0.31, green: 0.85, blue: 0.56, alpha: 1.00)]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(red: 0.31, green: 0.62, blue: 0.24, alpha: 1.00)]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black).edgesIgnoringSafeArea(.all)
                
                List(networkManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                                .frame(width: 50.0)
                            Text(post.title)
                        }
                    }.listRowBackground(Color.blue)
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Hacker News")
            }
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
