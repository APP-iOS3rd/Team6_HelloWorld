//
//  EX01.swift
//  AnimationDemo
//
//  Created by Taejun Ha on 12/20/23.
//

import SwiftUI

struct EX01: View {
    
    @Namespace private var menuItemTransition
    @State private var selectedIndex = 0

    private let menuItems = ["Travel", "Film", "Food & Drink"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.green)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            ForEach(menuItems.indices, id: \.self) { index in
                                if selectedIndex == index {
                                    Text(menuItems[index])
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 10)
                                        .background(Capsule().foregroundStyle(.purple))
                                        .matchedGeometryEffect(id: "menuItem", in: menuItemTransition)
                                } else {
                                    Text(menuItems[index])
                                        .foregroundStyle(.black)
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 10)
                                        .background(Capsule().foregroundStyle(Color(UIColor.systemGray5)))
                                        .onTapGesture {
                                            selectedIndex = index
                                        }
                                }
                                Spacer()
                            } //ForEach
                        } //HStack
                        .animation(.easeInOut, value: selectedIndex)
                    } //VStack
                } //overlay
            
            TapView(menuItem: menuItems[selectedIndex])
            
        } //ZStack
    }
}

struct TapView: View {
    private var menuItem: String
    
    init(menuItem: String) {
        self.menuItem = menuItem
    }
    
    var body: some View {
        VStack {
            Text(menuItem)
                .foregroundStyle(.white)
                .bold()
                .font(Font.system(size: 50))
                .fontDesign(.rounded)
            
        }
    }
}

#Preview {
    EX01()
}
