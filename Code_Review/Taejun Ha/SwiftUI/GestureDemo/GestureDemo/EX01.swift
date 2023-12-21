//
//  EX01.swift
//  GestureDemo
//
//  Created by Taejun Ha on 12/21/23.
//

import SwiftUI

struct EX01: View {
   
    var body: some View {
        AniLongPressGestureView()
    }
}

struct AniLongPressGestureView: View {
    
    @GestureState private var longPressTap = false
    @State private var isPressed = false
    
    var body: some View {
        Image(systemName: "staroflife.circle.fill")
            .font(.system(size: 200))
            .foregroundStyle(.mint)
            .opacity(longPressTap ? 0.5 : 1.0)
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut, value: isPressed)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .updating($longPressTap) { value, state, transaction in
                        state = value
                    }
                    .onEnded{ _ in self.isPressed.toggle() }
            )
    }
}

#Preview {
    EX01()
}
