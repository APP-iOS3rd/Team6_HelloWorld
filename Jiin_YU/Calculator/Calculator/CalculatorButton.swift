

import Foundation

/*Button*/

class CalculatorButton: ObservableObject {
    
    @Published var expression: String = ""
    private var calculation: CalculateFunction = CalculateFunction()
    
    
    init() {
        self.expression = ""
    }

    
    //버튼을 숫자, 오퍼레이션, 삭제, 결과 값(=)을 받기 위해 enum 사용
    /*'Hashable' :  */
    enum ButtonType : Hashable {
        case digit(String)
        case operatorButton(String)
        case delete
        case equals
        
    }

    let buttons: [[ButtonType]] = [
        [.delete, .operatorButton("%"), .operatorButton("÷")],
        [.digit("7"), .digit("8"), .digit("9"), .operatorButton("X")],
        [.digit("4"), .digit("5"), .digit("6"), .operatorButton("-")],
        [.digit("1"), .digit("2"), .digit("3"), .operatorButton("+")],
        [.digit("0"), .operatorButton("."), .equals]
    ]

    //buttons 에서 눌린 값을 가져와서 expression에 추가하
    func handleButtonpress(_ button: ButtonType) throws  {
        print("Before handleButtonpress: \(expression)")
            
            guard !expression.contains("=") else {
                print("Guard condition is true. Resetting expression.")
                expression.removeAll()
                return
            }
        
        do {
            switch button {
            case let .digit(value):
                expression.append(value)
      
            case let .operatorButton(op):
                 expression = try calculation.calculatedNumbers(expression)
                expression.append(op)
                
            case .delete:
                expression.removeAll()
                
            case .equals:
            
                expression = try calculation.calculatedNumbers(expression)
                expression.append("=")

            }
            
        }catch{
            print("Error: \(CalculatorError.unknownError)")
        }
    
      
    }
    
}
