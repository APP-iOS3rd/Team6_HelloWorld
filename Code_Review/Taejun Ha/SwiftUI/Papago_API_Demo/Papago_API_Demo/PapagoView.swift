//
//  ContentView.swift
//  Papago_API_Demo
//
//  Created by Taejun Ha on 12/1/23.
//

import SwiftUI

struct PapagoView: View {
    
    @StateObject var network = PapagoAPI.shared
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear(){
            network.fetchData()
        }
    }
}

#Preview {
    PapagoView()
}
