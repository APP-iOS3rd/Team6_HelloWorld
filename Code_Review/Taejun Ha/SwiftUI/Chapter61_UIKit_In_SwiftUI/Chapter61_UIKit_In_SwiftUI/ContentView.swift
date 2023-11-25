//
//  ContentView.swift
//  Chapter61_UIKit_In_SwiftUI
//
//  Created by Taejun Ha on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
            
            MyScrollView(text: "UIView in a SwiftUI")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
