//
//  PlayView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//  Tweaked 4/18/25
//

import SwiftUI

struct PlayView: View {
    @State private var wheelSymbols = ["flag.fill", "flag.fill", "flag.fill"]
    @State private var isSpinning   = false
    @State private var resultMessage: String = ""
    @State private var betAmount:   Double  = 0.10

    private let symbols = ["flag.fill", "star.fill", "heart.fill",
                           "bell.fill", "flame.fill", "leaf.fill"]

    var body: some View {
        ZStack {

            VStack(spacing: 22) {
                Text("American Reels")
                    .font(.system(size: 32, weight: .black))
                    .foregroundStyle(Color.accentColor)
                    .shadow(radius: 3)

                HStack {
                    ForEach(wheelSymbols, id: \.self) { sym in
                        Image(systemName: sym)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding(4)
                            .background(Color.white.opacity(0.9))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.blue, lineWidth: 3)
                            )
                    }
                }

                if !resultMessage.isEmpty {
                    Text(resultMessage)
                        .font(.title2.bold())
                        .foregroundColor(resultMessage == "You win!" ? .green : .blue)
                }

                HStack(spacing: 34) {
                    circleButton(system: "minus") {
                        if betAmount > 0.10 { betAmount -= 0.10 }
                    }
                    Text("\(betAmount, specifier: "$%.2f")")
                        .font(.title3.bold())
                        .padding(.horizontal, 14)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Capsule())
                    circleButton(system: "plus")  { betAmount += 0.10 }
                }

                Button(action: spinWheels) {
                    Text("SPIN")
                        .font(.system(size: 34, weight: .black))
                        .foregroundColor(.white)
                        .padding(.horizontal, 80)
                        .padding(.vertical, 18)
                        .background(
                            LinearGradient(colors: [.red, .blue],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 5, y: 4)
                }
                .disabled(isSpinning)
                .opacity(isSpinning ? 0.5 : 1)

                if isSpinning { ProgressView("Spinning…") }
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal)
        }
    }

    //  ─────────────  Helper Views & Buttons  ─────────────
    private func circleButton(system: String,
                              action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: "\(system).circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(.white)
                .background(Circle().fill(Color.red))
                .shadow(radius: 3)
        }
    }

    //  ─────────────  Game Logic  ────────────
    private func spinWheels() {
        resultMessage = ""
        isSpinning    = true

        let timer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { _ in
            wheelSymbols = wheelSymbols.map { _ in symbols.randomElement()! }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            timer.invalidate()
            wheelSymbols = wheelSymbols.map { _ in symbols.randomElement()! }
            resultMessage = wheelSymbols.allSatisfy { $0 == wheelSymbols.first } ? "You win!" : "Try again"
            isSpinning = false
        }
    }
}
