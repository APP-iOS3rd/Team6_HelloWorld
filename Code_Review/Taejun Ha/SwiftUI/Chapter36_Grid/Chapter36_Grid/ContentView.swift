//
//  ContentView.swift
//  Chapter36_Grid
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: GridEX02()) {
                Text("GridEX02")
            }
            NavigationLink(destination: GridRowDemoView()) {
                Text("GridRowDemoView")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
