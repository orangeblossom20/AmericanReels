//
//  SettingsView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//
import SwiftUI

struct SettingsView: View {
    @State private var vibrationEnabled = true
    @State private var musicEnabled = true
    @State private var darkModeEnabled = false

    var body: some View {
        NavigationView {
            Form {
                Toggle("Vibration Effects", isOn: $vibrationEnabled)
                Toggle("Music", isOn: $musicEnabled)
                Toggle("Dark Mode", isOn: $darkModeEnabled)
            }
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button("Close") {
            })
        }
    }
}
