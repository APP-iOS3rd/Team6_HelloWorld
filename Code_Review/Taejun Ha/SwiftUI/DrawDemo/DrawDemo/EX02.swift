//
//  EX02.swift
//  DrawDemo
//
//  Created by Taejun Ha on 12/19/23.
//

import SwiftUI
import Charts

struct EX02: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to:CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 190), clockwise: true)
            }
            .fill(.yellow)
            
            Path { path in
                path.move(to:CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 190), endAngle: Angle(degrees: 115), clockwise: true)
            }
            .fill(.teal)

            Path { path in
                path.move(to:CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 115), endAngle: Angle(degrees: 90), clockwise: true)
            }
            .fill(.blue)
            
            Path { path in
                path.move(to:CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
                path.closeSubpath()
            }
            .fill(.purple)
            .stroke(.black, style: StrokeStyle.init(lineWidth: 10))
            .offset(CGSize(width: 20.0, height: 20.0))
            .overlay {
                Text("25%")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .offset(x: 75, y: -100)
            }
        }
    }
}
#Preview {
    EX02()
}
