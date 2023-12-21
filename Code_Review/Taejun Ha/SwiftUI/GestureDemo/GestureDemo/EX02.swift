//
//  EX02.swift
//  GestureDemo
//
//  Created by Taejun Ha on 12/21/23.
//

import SwiftUI

//struct EX02: View {
//    var body: some View {
//        AniDragGestureView()
//       
//    }
//}
//
//struct AniDragGestureView: View {
//    
//    @GestureState private var offset: CGSize = .zero
//    @State private var position: CGSize = .zero
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "staroflife.circle.fill")
//                .font(.system(size: 100))
//                .offset(x: position.width + offset.width, y: position.height + offset.height)
//                .animation(.easeInOut, value: position)
//                .foregroundStyle(.green)
//                .gesture(
//                    DragGesture()
//                        .updating($offset) { dragValue, state, transaction in
//                            state = dragValue.translation
//                        }
//                        .onEnded{ value in
//                            self.position.width = value.translation.width
//                            self.position.height = value.translation.height
//                        }
//                )
//        }
//    }
//}

struct EX02: View {

    @State private var draggedOffset: CGSize = .zero
    @State private var accumulatedOffset: CGSize = .zero

    var body: some View {
        Image(systemName: "staroflife.circle.fill")
            .resizable()
            .foregroundStyle(.green)
            .frame(width: 100, height: 100)
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

extension CGSize {
    static func + (lhs: Self, rhs: Self) -> Self {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}

#Preview {
    EX02()
}
