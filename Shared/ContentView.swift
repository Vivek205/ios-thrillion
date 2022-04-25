//
//  ContentView.swift
//  Shared
//
//  Created by Vivek Narayanan on 23/02/2022.
//

import SwiftUI

let moatURL = "https://app.thrillion.in/"
let username = "thrillion"
let password = "thrillion@123"

struct ContentView: View {
    var body: some View {
        VStack{
            BrowserView(url: moatURL, username: username, password: password)
        }
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
