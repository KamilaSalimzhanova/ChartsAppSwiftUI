//
//  ChartsView.swift
//  ChartsAppSwiftUI
//
//  Created by kamila on 30.03.2025.
//

import SwiftUI
import Charts

struct ChartsView: View {
    let min = 0.0, max = 100.0
    var body: some View {
        VStack {
            Text("Welcome to charts")
            Chart {
                BarMark(x: .value("Day", "Sunday"),
                        y: .value("Sales", 10))
                .annotation {
                    Image(systemName: "figure.walk.circle.fill")
                        .foregroundColor(.blueViolet)
                        .font(.largeTitle)
                }
                BarMark(x: .value("Day", "Monday"),
                        y: .value("Sales", 50))
                .annotation(position: .bottom, alignment: .center) {
                    Image(systemName: "figure.dance")
                        .foregroundColor(.blueViolet)
                        .font(.largeTitle)
                }
                BarMark(x: .value("Day", "Tuesday"),
                        y: .value("Sales", 75))
            }
            .chartYScale(domain: min...max)
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
