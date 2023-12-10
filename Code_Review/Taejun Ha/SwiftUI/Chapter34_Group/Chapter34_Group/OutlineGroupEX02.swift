//
//  OutlineGroupEX02.swift
//  Chapter34_Group
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct MenuItem {
    let name: String
    let price: Double?
    let subItems: [MenuItem]?
}

let menuItems: [MenuItem] = [
    MenuItem(name: "Burger", price: 8000.0, subItems: nil),
    MenuItem(name: "Pizza", price: nil, subItems: [
        MenuItem(name: "Cheese", price: 12000.0, subItems: nil),
        MenuItem(name: "Pepperoni", price: 13000.0, subItems: nil),
        MenuItem(name: "Veggie", price: 13000.0, subItems: nil)
    ]),
    MenuItem(name: "Salad", price: 7000.0, subItems: nil),
]

struct OutlineGroupEX02: View {
    var body: some View {
        List {
            OutlineGroup(menuItems, id: \.name, children: \.subItems) { item in
                    Text(item.name)
                }
        }
    }
}


#Preview {
    OutlineGroupEX02()
}
