//
//  EX01.swift
//  DrawDemo
//
//  Created by Taejun Ha on 12/19/23.
//

import SwiftUI

struct EX01: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 50))
            path.addLine(to: CGPoint(x: 10, y: 100))
            path.addLine(to: CGPoint(x: 210, y: 100))
            path.addLine(to: CGPoint(x: 210, y: 50))
            path.addLine(to: CGPoint(x: 180, y: 50))
            path.addQuadCurve(to: CGPoint(x: 40 , y: 50), control: CGPoint(x: 110, y: 0))
            path.closeSubpath()
        }
        .fill(.purple)
        .stroke(.black, style: StrokeStyle.init(lineWidth: 5))
    }
}

#Preview {
    EX01()
}
