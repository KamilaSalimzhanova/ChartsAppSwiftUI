//
//  RandomArcFromColorListView.swift
//  ChartsAppSwiftUI
//
//  Created by kamila on 30.03.2025.
//

import SwiftUI

struct RandomArcFromColorListView: View {
    
    // MARK: - properties
    let colors: [Color]
    let index: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let opacity: CGFloat
    let startTrim = Double.random(in: 0...0.5)
    let endTrim = 1.0
    
    private var theIndex: CGFloat {
        index < colors.count && index >= 0 ? CGFloat(index) : 0
    }
    private var count: CGFloat { CGFloat(colors.count) }
    private var color: Color { colors[index] }
    private var endRadius: CGFloat { minRadius + maxRadius/count }
    private var rotate: CGFloat { Double.random(in: 0...360) }
    
    var body: some View {
        ArcView(color: color.opacity(opacity),
                startRadius: minRadius,
                endRadius: endRadius,
                startTrim: startTrim,
                endTrim: endTrim,
                rotate: rotate)
    }
}

struct RandomArcFromColorListView_Previews: PreviewProvider {
    static var previews: some View {
        RandomArcFromColorListView(
            colors: Color.defaultColors, index: 0, minRadius: 170, maxRadius: 180, opacity: 0.9)
    }
}
