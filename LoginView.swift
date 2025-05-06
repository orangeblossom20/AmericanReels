//
//  LoginView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool

    var body: some View {
        ZStack {
            Image("FlagImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
          
            VStack(spacing: 20) {
                Text("Great American Reels")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
                TextField("Email", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Log In") {
                    isLoggedIn = true
                }
                .padding()
            }
            .padding()
        }
    }
}
