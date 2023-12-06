//
//  HGridDemoView.swift
//  Chapter36_Grid
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct HGridDemoView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
    
    private var gridItems = [
        GridItem(.fixed(150)),
        GridItem(.adaptive(minimum: 50)),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        // 수평 그리드
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, spacing: 5){
                ForEach((0...99), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
            .padding(5)
        }
    }
}

// 셀 커스텀 뷰
private struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 75 , minHeight: 50, maxHeight: .infinity)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

#Preview {
    HGridDemoView()
}
