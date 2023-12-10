//
//  ContentView.swift
//  Chapter34_Group
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("[ 수업 ]").foregroundStyle(.black).font(.title2)) {
                    NavigationLink(destination: ListView()) {
                        Text("ListView 사용")
                    }
                    NavigationLink(destination: OutlineGroupView()) {
                        Text("OutlineGroupView 사용")
                    }
                    NavigationLink(destination: SettingsView()) {
                        Text("DisclosureGroup 사용")
                    }
                }
                
                Section(header: Text("예제").foregroundStyle(.black).font(.title2)) {
                    NavigationLink(destination: OutlineGroupEX01()) {
                        Text("OutlineGroup 예제-01")
                    }
                    NavigationLink(destination: OutlineGroupEX02()) {
                        Text("OutlineGroup 예제-02")
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
