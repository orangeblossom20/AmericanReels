//
//  RewardView.swift
//  AmericanReels
//
//  Created by Tamarrah Morgan on 3/14/25.
//  Updated 4/18/25
//

import SwiftUI

struct RewardView: View {
    @Binding var showGameRules: Bool

    // demo state
    @State private var currentDay = 1
    private let totalDays = 7

    var body: some View {
        ZStack {

            VStack(spacing: 24) {

                VStack(spacing: 2) {
                    Text("Bonus Quest")
                        .font(.system(size: 38, weight: .black))
                        .foregroundStyle(Color.accentColor)
                    Text("This Week")
                        .font(.title3)
                    
                }

                // entire quest draws inside GeometryReader and auto‑scales
                GeometryReader { geo in
                    QuestPath(currentDay: $currentDay,
                              totalDays: totalDays,
                              frameSize: geo.size)
                }
                .padding(.horizontal, 16)

  
                HStack(spacing: 18) {
                    Button("Simulate Next Day") {
                        if currentDay < totalDays { currentDay += 1 }
                    }
                    .buttonStyle(GradientButtonStyle())

                    Button("Game Rules") { showGameRules.toggle() }
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 20)
            }
            .padding(.top, 16)
        }
    }
}

// MARK: - Quest path that fits the available height
private struct QuestPath: View {
    @Binding var currentDay: Int
    let totalDays: Int
    let frameSize: CGSize                     // supplied by GeometryReader

    private var step: CGFloat {               // evenly distribute nodes
        max(frameSize.height / CGFloat(totalDays + 1), 70)
    }

    var body: some View {
        let leftX  = frameSize.width * 0.28
        let rightX = frameSize.width * 0.72

        // build bottom‑to‑top points
        let points: [CGPoint] = (0..<totalDays).map { idx in
            let y = frameSize.height - CGFloat(idx + 1) * step
            let x = (idx % 2 == 0) ? leftX : rightX
            return CGPoint(x: x, y: y)
        }

        ZStack {
            // wavy dotted connector
            Path { p in
                guard let first = points.first else { return }
                p.move(to: first)

                for i in 1..<points.count {
                    let prev = points[i - 1], next = points[i]
                    let midY = (prev.y + next.y) / 2
                    p.addCurve(to: next,
                               control1: .init(x: prev.x, y: midY),
                               control2: .init(x: next.x, y: midY))
                }
            }
            .stroke(style: StrokeStyle(lineWidth: 3,
                                       lineCap: .round,
                                       dash: [8, 8]
                                   ))
            .foregroundColor(.black)

            // gift nodes
            ForEach(0..<totalDays, id: \.self) { rawIdx in
                let idx = totalDays - 1 - rawIdx      // Day 1 at bottom
                let day = idx + 1
                let pt  = points[idx]

                VStack(spacing: 4) {
                    Image(systemName: "gift.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(day <= currentDay ? .green : .gray)
                    Text("Day \(day)")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(day <= currentDay ? .green : .gray)
                }
                .position(pt)
            }
        }
    }
}


private struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration c: Configuration) -> some View {
        c.label
            .font(.headline.bold())
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .background(
                LinearGradient(colors: [.red, .blue],
                               startPoint: .leading,
                               endPoint: .trailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(c.isPressed ? 0.6 : 1)
    }
}
