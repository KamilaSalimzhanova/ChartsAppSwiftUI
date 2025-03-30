//
//  TestColorButtonView.swift
//  ChartsAppSwiftUI
//
//  Created by kamila on 30.03.2025.
//

import SwiftUI

struct TestColorButtonView: View {
    @State private var colors = Color.defaultColors
    @State private var rotateBar: Bool = false
    @State private var tilt: CGFloat = 0.0
    
    private var count: CGFloat { CGFloat(colors.count) }
    private var width: CGFloat { UIScreen.main.bounds.width / count - 5 }
    private let threshold = 30.0
    var body: some View {
        NavigationStack {
            HStack(alignment: .bottom, spacing: 3) {
                ForEach(colors, id: \.self) { color in
                    let height = Double.random(in: 50...200)
                    RoundedRectangleView(color: color, barWidth: width, height: height)
                }
            }
            .rotation3DEffect(.degrees(rotateBar ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(-tilt * 45), axis: (x: 0, y: 1, z: 0))
            .scaleEffect(tilt != 0 ? 0.8 : 1)
            .gesture(
                DragGesture()
                    .onChanged{val in
                        withAnimation {
                            if val.translation.width > threshold {
                                tilt = -1
                            } else {
                                if val.translation.width < -threshold {
                                    tilt = 1
                                } else {
                                    tilt = 0
                                }
                            }
                        }
                    }
            )
            .onTapGesture {
                withAnimation { tilt = 0 }
            }
        }
    }
}

struct RoundedRectangleView: View {
    let color: Color
    let barWidth: CGFloat
    let height: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(color)
            .frame(width: barWidth, height: height, alignment: .center)
            .overlay (
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 0.7)
                    .frame(width: barWidth, height: height, alignment: .center)
            )
    }
}
struct TestColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TestColorButtonView()
    }
}
