//
//  ContentView.swift
//  Calculator
//
//  Created by YOU on 10/28/23.
//

import SwiftUI

struct ContentView : View {
  @State var expression: String = ""
    @StateObject private var calculation: CalculateFunction = CalculateFunction()
    
  var body: some View {
    VStack {
    
      TextField("Enter number", text: $expression)
            .font(.system(size: 40))
            .fontWeight(.heavy)
            .frame(height: 200)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
            .padding()
            
        HStack{
             
            Button(action: {
                
                   expression = ""
            }) {
                Text("C")
                    .modifier(StandardNumber())
            }
            Button(action: {
                expression = calculation.calculatedNumbers(expression)
            }) {
                Text("?")
                    .modifier(StandardNumber())
            }
            Button(action: {
                expression = calculation.calculatedNumbers(expression)
                expression.append("/")
            }) {
                Text("/")
                    .modifier(StandardNumber())
            }
            Button(action: {
                expression = calculation.calculatedNumbers(expression)
                expression.append("%")
            }) {
                Text("%")
                    .modifier(StandardNumber())
            }
     
        }
        HStack{
             
            Button(action: {expression.append("7")}) {
                Text("7")
                    .modifier(StandardNumber())
            }
            Button(action: {expression.append("8") }) {
                Text("8")
                    .modifier(StandardNumber())
            }
            Button(action: {expression.append("9") }) {
                Text("9")
                    .modifier(StandardNumber())
            }
            Button(action: {
                expression = calculation.calculatedNumbers(expression)
                expression.append("*")
            }) {
                Text("*")
                    .modifier(StandardNumber())
            }
     
        }
        HStack{
             
            Button(action: {expression.append("4")}) {
                Text("4")
                    .modifier(StandardNumber())
            }
            Button(action: {expression.append("5")}) {
                Text("5")
                    .modifier(StandardNumber())
            }
            Button(action: {expression.append("6")}) {
                Text("6")
                    .modifier(StandardNumber())
            }
            Button(action: { 
                expression = calculation.calculatedNumbers(expression)
                expression.append("-")
            }) {
                Text("-")
                    .modifier(StandardNumber())
            }
     
        }
        HStack{
             
            Button(action: {expression.append("1")}) {
                Text("1")
                    .modifier(StandardNumber())
            }
            Button(action: {expression.append("2")}) {
                Text("2")
                    .modifier(StandardNumber())
            }
            Button(action: {expression.append("3")}) {
                Text("3")
                    .modifier(StandardNumber())
            }
            Button(action: {
                expression = calculation.calculatedNumbers(expression)
                expression.append("+")
            }) {
                Text("+")
                    .modifier(StandardNumber())
            }
     
        }
        HStack{
            
            Button(action: {expression.append("0")}) {
                Text("0")
                    .modifier(StandardZero())
            }
            Button(action: { }) {
                Text(".")
                    .modifier(StandardNumber())
            }
            Button(action: { 
                expression = calculation.calculatedNumbers(expression)
                
            }) {
                Text("=")
                    .modifier(StandardNumber())
            }
                
        }
    }
      
  }
   struct StandardNumber: ViewModifier {
       func body(content: Content) -> some View {
           content
               .frame(width:40)
               .font(.system(size: 40))
               .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
               .padding(20)
               .background(Color(.secondarySystemBackground))
               .cornerRadius(20)
       }
    }
    struct StandardZero: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width:130)
                .font(.system(size: 40))
                .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                .padding(20)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
        }
     }
    
    
}
#Preview {
    ContentView()
}
