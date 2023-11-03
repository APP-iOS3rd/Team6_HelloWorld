

import Foundation

class CalculateFunction: ObservableObject {
    
    var expression: String
    
    init(_ expression: String = "") {
        self.expression = expression
    }
    
    func calculatedNumbers(_ expression: String) -> String {
        let operators = expression.filter { "+-*/%".contains($0) }
               let numbers = expression
                   .replacingOccurrences(of: "[^0-9%+-/*]", with: "", options: .regularExpression)
                   .split(whereSeparator: { "+-*/%".contains($0) })
                   .compactMap { Int($0) }
        
        // Check for invalid expressions
        guard numbers.count > 0, operators.count == numbers.count - 1 else {
            return "Error: Invalid expression"
        }
        
        var result = numbers.first ?? 0
        for (index, operatorChar) in operators.enumerated() {
            let number = numbers[index + 1]
            switch operatorChar {
            case "%":
                result = Int(Double(result) * (Double(number) / 100.0))
            case "+":
                result += number
            case "-":
                result -= number
            case "*":
                result *= number
            case "/":
                if number != 0 {
                    result = Int(number) / Int(number)
                } else {
                    return "Error: Division by zero"
                }
            default:
                break
            }
        }
        
        return "\(result)"
    }
}

let cal = "100%"
var newCal: CalculateFunction = CalculateFunction()


