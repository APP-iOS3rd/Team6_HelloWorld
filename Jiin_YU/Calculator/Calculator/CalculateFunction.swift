
import Foundation

class CalculateFunction: ObservableObject {
    @Published var expression: String
    var lastButtonType: CalculatorButton.ButtonType?
    var calculatorError : CalculatorError
    
    init(_ expression: String = "", _ calculatorError: CalculatorError? = nil) {
        self.expression = expression
        self.calculatorError = calculatorError ?? CalculatorError.unknownError
        
        if let error = calculatorError {
            print("Error: \(error.localizedDescription)")
        }
       
    }
    
    func calculatedNumbers(_ expression: String) throws -> String {
        
        if lastButtonType == CalculatorButton.ButtonType.equals {
            self.expression = " "
           
                }
       
        
        let operators = expression.filter { "+-X÷%".contains($0) }
        let numbers = expression
            .replacingOccurrences(of: "[^0-9%+-÷X]", with: "", options: .regularExpression)
            .split(whereSeparator: { "+-X÷%".contains($0) })
            .compactMap { Double($0) }
        
        guard numbers.count > 0, operators.count == numbers.count - 1 else {
            throw CalculatorError.worngNumber
        }
        
        var result = numbers.first ?? 0
        for (index, operatorChar) in operators.enumerated() {
            let number = Double(numbers[index + 1])
            switch operatorChar {
            case "%":
                result = Double(Int(result * (number / 100.0)))
            case "+":
                result += number
            case "-":
                result -= number
            case "X":
                result = Double(Int(result * number))
            case "÷":
                if number != 0 {
                    result = Double(Int(result / number))
                } else {
                   throw CalculatorError.notAllowByZero
                }
            default:
                break
            }
        }
        return "\(Int(result))"
    }
}
