//
//  HomeView.swift
//  DrawDemo
//
//  Created by Taejun Ha on 12/19/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List{
                NavigationLink("수업", destination: ContentView())
                NavigationLink("예제1", destination: EX01())
                NavigationLink("예제2", destination: EX02())
                NavigationLink("예제3", destination: EX03())
            }
        }
    }
}


#Preview {
    HomeView()
}
