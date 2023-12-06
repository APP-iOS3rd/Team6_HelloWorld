//
//  GridEX01.swift
//  Chapter36_Grid
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct GridEX01: View {
    
    private var gridItems = Array(repeating: GridItem(), count: 3)
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 5) {
                    ForEach((0..<gridItems.count*gridItems.count), id: \.self) { index in
                        CellContent(index: index, w: geometry.size.width/CGFloat(gridItems.count))
                    }
                }
                .padding(5)
            }
        }
    }
}

private struct CellContent: View {
    var index: Int
    var w: CGFloat
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: w, minHeight: 100)
            .background(.red)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

#Preview {
    GridEX01()
}
