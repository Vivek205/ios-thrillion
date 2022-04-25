//
//  BrowserView.swift
//  TestHeadless-1
//
//  Created by Vivek Narayanan on 23/02/2022.
//

import SwiftUI
import WebKit

struct BrowserView: UIViewRepresentable {
    let url: String
    let username: String;
    let password: String;
    
    let credential:URLCredential;
    
    init(url:String, username:String, password:String){
        self.url = url;
        self.username = username;
        self.password = password
        self.credential = URLCredential(user: self.username, password: self.password, persistence: .none)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    typealias UIViewType = WKWebView
    

    private let webView = WKWebView()
    
    
    func getURLRequest() -> URLRequest{
        let urlObject = URL(string:url)!
        let request = URLRequest(url: urlObject)
        return request
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(getURLRequest())
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, URLSessionTaskDelegate {
        private var parent: BrowserView

        init(_ parent: BrowserView) {
            self.parent = parent
        }
    
        func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            completionHandler(.useCredential, parent.credential)
        }
    }
}


struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView(url: "https://www.google.com/", username: "", password: "")
    }
}
