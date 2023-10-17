// Stack 예제 1
//
//var stack = [Character]()
//var answer = true
//
//let brackets = readLine()!
//
//for i in brackets {
//    if !answer {
//        break
//    }
//    switch i {
//    case "(", "{", "[":
//        stack.append(i)
//    case ")":
//        if let element = stack.popLast() {
//            answer = (element != "(" ? false : answer)
//            break
//        }
//        answer = false
//    case "}":
//        if let element = stack.popLast() {
//            answer = (element != "{" ? false : answer)
//            break
//        }
//        answer = false
//    case "]":
//        if let element = stack.popLast() {
//            answer = (element != "[" ? false : answer)
//            break
//        }
//        answer = false
//    default: break
//    }
//}
//
//answer = (stack.isEmpty ? answer : false)
//print(answer)



// Stack 예제 2
//
//var stack = [String]()
//let postfixNotation = readLine()!.split(separator: " ").map{String($0)}
//
//for i in postfixNotation {
//    switch i {
//    case "*":
//        let op2 = Int(stack.popLast()!)!
//        let op1 = Int(stack.popLast()!)!
//        stack.append(String(op1 * op2))
//    case "/":
//        let op2 = Int(stack.popLast()!)!
//        let op1 = Int(stack.popLast()!)!
//        stack.append(String(op1 / op2))
//    case "+":
//        let op2 = Int(stack.popLast()!)!
//        let op1 = Int(stack.popLast()!)!
//        stack.append(String(op1 + op2))
//    case "-":
//        let op2 = Int(stack.popLast()!)!
//        let op1 = Int(stack.popLast()!)!
//        stack.append(String(op1 - op2))
//    default:
//        stack.append(i)
//    }
//}
//
//print(Int(stack.last!)!)


// Stack 예제 3 - 실패
//
//import Foundation
//
//var stack1 = [String]()
//var stack2 = [String]()
//var operatorStack = [String]()
//
////var infixNotation = readLine()!.components(separatedBy: ["(", ")"]).filter{ $0 != ""}
//
////let infixNotationArray = [[String]]()
//
////print(infixNotation)
//
//var infixNotation = readLine()!
//
//var priorityUp = false
//for i in infixNotation {
//    if i == " "{
//        continue
//    }
//    if i == "(" {
//        priorityUp = true
//        continue
//    }
//    if i == ")" {
//        priorityUp = false
//        stack1 += stack2
//        continue
//    }
//    if priorityUp {
//        if let value = Int(String(i)) {
//            stack1.append(String(value))
//            if !operatorStack.isEmpty{
//                stack1.append(operatorStack.popLast()!)
//            }
//        } else {
//            operatorStack.append(String(i))
//        }
//    } else {
//        if let value = Int(String(i)) {
//            stack2.append(String(value))
//            if !operatorStack.isEmpty{
//                stack2.append(operatorStack.popLast()!)
//            }
//        } else {
//            operatorStack.append(String(i))
//        }
//    }
//}
//
//print((stack1 + stack2).joined(separator: " "))



// Stack 예제 3 재도전중
//import Foundation
//
//var stack = [String]()
////var stack2 = [String]()
//var operatorStack1 = [String]()
//var operatorStack2 = [String]()
//
////var infixNotation = readLine()!.components(separatedBy: ["(", ")"]).filter{ $0 != ""}
//
////let infixNotationArray = [[String]]()
//
////print(infixNotation)
//
//var infixNotation = readLine()!
//
//var priorityUp = false
//for i in infixNotation {
//    if i == " "{
//        continue
//    }
//    if i == "(" {
//        priorityUp = true
//        continue
//    }
//    if i == ")" {
//        priorityUp = false
////        stack1 += stack2
//        continue
//    }
//    if priorityUp {
//        if let value = Int(String(i)) {
//            stack.append(String(value))
//            if !operatorStack1.isEmpty{
//                stack.append(operatorStack1.popLast()!)
//            }
//        } else {
//            operatorStack1.append(String(i))
//        }
//    } else {
//        if let value = Int(String(i)) {
//            stack.append(String(value))
//            if !operatorStack2.isEmpty{
//                stack.append(operatorStack2.popLast()!)
//            }
//        } else {
//            operatorStack2.append(String(i))
//        }
//    }
//}
//
////print((stack1 + stack2).joined(separator: " "))

