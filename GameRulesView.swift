//
//  GameRulesView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//
import SwiftUI

struct GameRulesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("""
                Up to 150 ways to win!
                
                Wins pay from left to right.
                Malfunction voids all pays and plays

                The maximum win form single game is $2000 / X500 total bet - whichever is reached first (or currency equivalent, other operator limits may apply.

                Return to Player (RTP): 89%
                RTP is based on long-term payback and game play.

                """)
                .padding()
                .foregroundStyle(Color.accentColor)
            }
            .navigationTitle("Game Rules")
            .navigationBarItems(trailing: Button("Close") {
            })
        }
    }
}
