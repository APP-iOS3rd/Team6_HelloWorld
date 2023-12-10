//
//  OutlineGroupEX01.swift
//  Chapter34_Group
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct AlphabetInfo: Identifiable {
    var id = UUID()
    var alphabet: String
    var children: [AlphabetInfo]?
}

let alphabetItems: [AlphabetInfo] = [
    AlphabetInfo(alphabet: "A", children: [
        AlphabetInfo(alphabet: "B"),
        AlphabetInfo(alphabet: "C", children: [
            AlphabetInfo(alphabet: "D"),
            AlphabetInfo(alphabet: "E")
        ])
    ]),
    AlphabetInfo(alphabet: "F")
]

struct OutlineGroupEX01: View {
    var body: some View {
        List {
//            ForEach(alphabetItems) { items in
//                OutlineGroup(items, children: \.children) { item in
//                    SubView(alphabet: item.alphabet)
//                }
//            } // ForEach
            OutlineGroup(alphabetItems, children: \.children){ item in
                SubView(alphabet: item.alphabet)
            }
        } // List
    }
}

struct SubView: View {
    var alphabet: String
    
    var body: some View {
        Text(alphabet)
    }
}

#Preview {
    OutlineGroupEX01()
}
