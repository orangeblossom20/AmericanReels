//
//  MainTabView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//
import SwiftUI

struct MainTabView: View {
    @State private var showGameRules = false
    @State private var showSettings  = false
    @State private var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab){
            RewardView(showGameRules: $showGameRules)
                .tag(0)
                .tabItem {
                    Image(systemName: "gift.fill")
                    Text("Reward")
                }
            
            PlayView()
                .tag(1)
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Play")
                }
            
            DepositView()
                .tag(2)
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Deposit")
                }
        }
        
        
        .sheet(isPresented: $showGameRules) {
            GameRulesView()
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .navigationBarTitle("Great American Reels", displayMode: .inline)
        .toolbar {
            Button(action: {
                showSettings.toggle()
            }) {
                Image(systemName: "gear")
            }
        }
    }
}
