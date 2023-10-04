import UIKit

//stack 예제 1
//
//스택을 이용하여 괄호의 짝이 맞는지 검사하는 알고리즘을 설계하고 구현하세요.
//예를 들어, "(()())"는 올바른 괄호이지만, "())("는 올바르지 않습니다. 입력은 문자열로 받으며, 출력은 Bool 타입으로 반환하세요.


func bracketValidate(_ sign:String) -> Bool {
    //Character 대문자로 쓰면서 데이터 타입
    var stack = [Character]()
    
    //주어진 괄호를 돌면서 체크: 하나라도 충족하면 다음으로 넘어감
    for i in sign {
        if (i == "(") || (i == "{") || (i == "[") {
            
            //충족된 거 stack 에 저장
            stack.append(i)
            
            // 클로징이 나왔을 먼저 나욌을 때 만약 stack이 비어있다면 false -> 짝이 없음
        }else if(i == ")") || (i == "}") || (i == "]") {
            if stack.isEmpty {
                return false
            }
            
            //endBracket != "(" => 없다면 위에서 받은 오픈이 없는 것
            var endBracket = stack.removeLast()
            if (i == ")") && endBracket != "(" ||
               (i == "}") && endBracket != "{" ||
               (i == "]") && endBracket != "[" {
                return false
            }
        }
        
    }
    //비어있다는 것 -> true
    return stack.isEmpty
}

//print(bracketValidate("()()"))
//print(bracketValidate("({[}])"))
//print(bracketValidate("())("))
//print(bracketValidate("({}[()]())"))




//stack 예제 2
//
//스택을 이용하여 후위 표기법(postfix notation)으로 된 수식을 계산하는 알고리즘을 설계하고 구현하세요.
//(함수 추천, readLine사용하지 않아도 수식을 함수에 전달하면됨)
//예를 들어, "2 3 + 4 *"는 (2 + 3) * 4와 같은 수식입니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 Int 타입으로 반환하세요.

let expression = "2 3 + 4 *"

func expressionCheck(_  expression: String) -> Int {
    var stack = [Int]()
    let tokens = expression.split(separator: " ")
    for token in tokens {
        if var number = Int(token) {
            stack.append(number)
        }else {
            
            guard stack.count >= 2 else {
                fatalError ("erorr")
                
            }
            
            let secondNum = stack.removeLast()
            let firstNum = stack.removeLast()
            switch token {
            case "+":
                stack.append(firstNum + secondNum)
            case "-":
                stack.append(firstNum - secondNum)
            case "*":
                stack.append(firstNum * secondNum)
            case "/":
                stack.append(firstNum / secondNum)
            default:
                print("ettor")
            }
            
        }
       
    }
    guard let result = stack.first, stack.count == 1 else {
        fatalError("error")
    }
    return result
}

let newNum = "2 3 + 4 *"
let numCheck = expressionCheck(newNum)
print(numCheck)
