//
//  EX03.swift
//  DrawDemo
//
//  Created by Taejun Ha on 12/19/23.
//

import SwiftUI

struct EX03: View {
    let startX =  UIScreen.main.bounds.midX - 100
    let startY = UIScreen.main.bounds.midY
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: startX, y: startY))
            path.addLine(to: CGPoint(x: startX + 200, y: startY))
            path.addLine(to: CGPoint(x: startX + 100, y: startY - 170))
            path.closeSubpath()
        }
        .stroke(Color.blue, lineWidth: 5)
    }
}

#Preview {
    EX03()
}
