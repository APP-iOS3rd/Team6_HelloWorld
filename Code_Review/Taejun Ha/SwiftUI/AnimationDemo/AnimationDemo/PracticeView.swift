//
//  PracticeView.swift
//  AnimationDemo
//
//  Created by Taejun Ha on 12/20/23.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
        NavigationStack{
            Form {
                Section("예제") {
                    NavigationLink("EX01", destination: EX01())
                    NavigationLink("EX02", destination: EX02())
                }
            }
        }
    }
}

#Preview {
    PracticeView()
}
