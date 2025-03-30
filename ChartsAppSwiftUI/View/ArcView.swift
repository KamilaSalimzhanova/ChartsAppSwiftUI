//
//  ArcView.swift
//  ChartsAppSwiftUI
//
//  Created by kamila on 30.03.2025.
//

import SwiftUI

struct ArcView: View {
    @State private var finalTrim: CGFloat = 0.0
    
    let color: Color
    let startRadius: CGFloat
    let endRadius: CGFloat
    let startTrim: CGFloat
    let endTrim: CGFloat
    let rotate: CGFloat
    
    private var lineWidth: CGFloat { endRadius - startRadius }
    
    var body: some View {
        Circle()
            .trim(from: startTrim, to: finalTrim)
            .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(Angle(degrees: rotate))
            .frame(width: endRadius-lineWidth, height: endRadius-lineWidth)
            .onAppear {
                withAnimation {
                    finalTrim = endTrim
                }
            }
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView(color: Color.darkOrchid,
                startRadius: 90,
                endRadius: 100,
                startTrim: 0.25,
                endTrim: 0.75,
                rotate: 30)
    }
}
