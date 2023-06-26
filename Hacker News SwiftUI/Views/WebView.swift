//
//  WebView.swift
//  Hacker News SwiftUI
//
//  Created by Ryan Henzell-Hill on 26/06/2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let safeURL = urlString else { return }
        guard let url = URL(string: safeURL) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
