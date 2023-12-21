//
//  EX03.swift
//  GestureDemo
//
//  Created by Taejun Ha on 12/21/23.
//

import SwiftUI

struct EX03: View {
    var body: some View {
        
        DragCircleImageView(imageName: "staroflife.circle.fill", foregroundColor: .green)
        
        DragTextView(text: "Swift")
        
        DragCircleImageView(imageName: "circle.fill", foregroundColor: .purple)
    }
}

struct DragCircleImageView: View {
    var imageName: String
    var foregroundColor: Color
    
    @State private var draggedOffset: CGSize = .zero
    @State private var accumulatedOffset: CGSize = .zero
    
    var body: some View {
        
        Image(systemName: imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundStyle(foregroundColor)
            .offset(draggedOffset)
            .gesture(drag)
        
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged{ gesture in
                draggedOffset = accumulatedOffset + gesture.translation
            }
            .onEnded{ gesture in
                accumulatedOffset = accumulatedOffset + gesture.translation
            }
    }
}

struct DragTextView: View {
    var text: String
    
    @State private var draggedOffset: CGSize = .zero
    @State private var accumulatedOffset: CGSize = .zero
    
    var body: some View {
        Text(text)
            .font(.system(size: 40, weight: .heavy, design: .rounded))
            .foregroundStyle(.red)
            .offset(draggedOffset)
            .gesture(drag)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged{ gesture in
                draggedOffset = accumulatedOffset + gesture.translation
            }
            .onEnded{ gesture in
                accumulatedOffset = accumulatedOffset + gesture.translation
            }
    }
}

#Preview {
    EX03()
}
