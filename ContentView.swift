//
//  ContentView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    // Track whether the user is logged in
    @State private var isLoggedIn: Bool = false

    var body: some View {
        Group {
            if isLoggedIn {
                MainTabView()
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    ContentView()
}
