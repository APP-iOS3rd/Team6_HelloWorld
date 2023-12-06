//
//  GridEX02.swift
//  Chapter36_Grid
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct GridEX02: View {
    @State private var sliderValue: Double = 1.0
    
    @State private var gridItems = [
        GridItem()
    ]
    
    var body: some View {
        VStack {
//            Slider(value: $sliderValue, in: 1...5, step: 1)
//                .onChange(of: sliderValue) { newValue in
//                    withAnimation{
//                        gridItems = Array(repeating: GridItem(), count: Int(newValue))
//                    }
//                }
            
            Slider(value: $sliderValue, in: 1...5, step: 1) { _ in
                withAnimation{
                    gridItems = Array(repeating: GridItem(), count: Int(sliderValue))
                }
            }
            
            Spacer()
            LazyVGrid(columns: gridItems) {
                ForEach((0..<5)) { _ in
                    CellContent()
                }
            }
            Spacer()
        }
        .padding()
    }
}

private struct CellContent: View {
    var body: some View {
        Text("1")
            .frame(minWidth: 50, maxWidth: 75, minHeight: 100)
            .background(.red)
            .cornerRadius(8)
            .font(.title)
    }
}

#Preview {
    GridEX02()
}
