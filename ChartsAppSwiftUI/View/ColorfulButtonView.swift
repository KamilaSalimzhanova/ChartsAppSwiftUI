//
//  ColorfulButtonView.swift
//  ChartsAppSwiftUI
//
//  Created by kamila on 30.03.2025.
//

import SwiftUI

struct ColorfulButtonView: View {
    @Binding var colors: [Color]
    @State private var flip: Bool = false
    let dim: CGFloat
    let offsetVal: CGFloat
    let action: ()->Void
    
    private var countVal: CGFloat {
        CGFloat(colors.count)
    }
    private var factor: CGFloat { (dim - offsetVal) / countVal }
    private var lastColor: Color { colors.last ?? .black }
    var body: some View {
        ZStack {
            ForEach(0 ..< colors.count, id:\.self) { i in
                RandomArcFromColorListView(
                    colors: colors,
                    index: i,
                    minRadius: minRadius(i, offsetVal),
                    maxRadius: maxRadius(i, offsetVal),
                    opacity: 0.9)
            }
            Circle()
                .stroke(lastColor, lineWidth: factor)
                .frame(width: dim, height: dim)
        }
        .rotation3DEffect(flip ? Angle(degrees: 0) : Angle(degrees: 180), axis: (x: Double.random(in: -1...1), y: Double.random(in: -1...1), z: 0))
        .onTapGesture {
            colors = Color.randomNColors(colors.count)
            withAnimation {
                flip.toggle()
            }
            action()
        }
    }
    
    private func minRadius(_ i: Int, _ offset: CGFloat) -> CGFloat {
        factor * CGFloat(i) + offset
    }
    private func maxRadius(_ i: Int, _ offset: CGFloat) -> CGFloat {
        factor * CGFloat(i+1) + offset
    }
}

struct ColorfulButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulButtonView(colors: .constant(Color.defaultColors), dim: 40, offsetVal: 10, action: {})
    }
}
