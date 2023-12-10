//
//  SettingsView.swift
//  Chapter34_Group
//
//  Created by Taejun Ha on 11/8/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var hybridState: Bool = false
    @State private var electricState: Bool = true
    @State private var fuelCellState: Bool = false
    @State private var inversionState: Bool = true
    
    // 최초 표시될 때 펼쳐진 상태로 표시되도록
    // DisclosureGroup의 isExpanded: 초기화 매개변수로 지정
    @State private var filtersExpanded: Bool = true
    
    var body: some View {
        Form {
            DisclosureGroup(isExpanded: $filtersExpanded) {
                ToggleControl(title: "Hybrid Cars", state: hybridState)
                ToggleControl(title: "Electric Cars", state: electricState)
                ToggleControl(title: "Fuel Cell Cars", state: fuelCellState)
            } label: {
                Label("Categories Filters", systemImage: "car.2.fill")
            }
            
            DisclosureGroup {
                ColorControl(color: .red, label: "Background Color")
                ColorControl(color: .blue, label: "Foreground Color")
                ToggleControl(title: "Color Inversion", state: inversionState)
            } label: {
                Label("Color Settings", systemImage: "scribble.variable")
            }
        }
    }
}

struct ToggleControl: View {
    var title: String
    @State var state: Bool
    
    var body: some View {
        Toggle(title, isOn: $state)
            .padding(.leading)
    }
}

struct ColorControl: View {
    var color: Color
    var label: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Rectangle()
                .fill(color)
                .frame(width: 30, height: 30)
        }
        .padding(.leading)
        .scaledToFill()
    }
}

#Preview {
    SettingsView()
}
