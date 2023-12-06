//
//  GridDemoView.swift
//  Chapter36_Grid
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct VGridDemoView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
//    private var gridItems = [
//        GridItem(),
//        GridItem(),
//        GridItem(),
//        GridItem()
//    ]
  
    
    
    // [적응형 GridItem]
//    private var gridItems = [
//        // 뷰가 차지하는 공간에 맞출 수 있는 한 많은 열이 자동으로 표시되도록 그리드 뷰를 구성
//        // 열의 너비가 50pt 보다 작을 수 없다는 제한과 함께 그리드에 가능한 많은 열이 표시됨
//        GridItem(.adaptive(minimum: 50))
//    ]
    
    
    // [고정형 GridItme]
//    private var gridItems = [
//        // 너비가 100pt인 열을 그리드가 표시
//        GridItem(.fixed(75)),
//        GridItem(.fixed(125)),
//        GridItem(.fixed(175))
//    ]
    
    
    // [고정형 & 적응형 GridItem]
    private var gridItems = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 50)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 5){
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
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

#Preview {
    VGridDemoView()
}
