//
//  DepositView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//
import SwiftUI

struct DepositView: View {
    var body: some View {
        VStack {
            Text("Deposit")
                .foregroundStyle(Color.accentColor)
                .font(.largeTitle)
                .padding()

            Text("Select a payment method:")
                .foregroundStyle(Color.accentColor)
                .padding(.bottom, 10)

            HStack {
                Image(systemName: "creditcard")
                Image(systemName: "dollarsign.circle")
                Image(systemName: "bitcoinsign.circle")
            }
            .font(.largeTitle)

            Button("Confirm Deposit") {
            }
            .padding()
        }
    }
}
