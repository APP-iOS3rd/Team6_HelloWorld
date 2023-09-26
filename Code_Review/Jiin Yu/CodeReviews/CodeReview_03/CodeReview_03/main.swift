//
//  main.swift
//  CodeReview_03
//
//  Created by YOU on 2023/09/26.
//

import Foundation

//3,6,9 게임
//for i in 1...99 {
//    let a = i / 10 //10의 자리 -> 01,02 가능
//    let b = i % 10 //1의 자리
//    print("\(a)\(b)",terminator: "")
//    
//    if (a % 3 == 0) && (a != 0) {
//        print("*", terminator: "")
//    }
//    if (b % 3 == 0) && (b != 0) {
//        print("*", terminator: "")
//    }
//    print()
//}

//함수 예제 1
//(1)
//func addNumber(a: Int, b: Int) -> Int{
//    let res = a + b
//    print("1 번째 수:", terminator: "")
//    let a = Int(readLine()!)
//    print("2 번째 수:", terminator: "")
//    let b = Int(readLine()!)
//    return res
//    
//}
//
//print("연산 결과 : \(addNumber(a: 30, b: 5))")
//
//(2)
//func addNumber(a: Int, b: Int) -> Int{
//    let res = a + b
//    return res
//}
//print("연산 결과 : \(addNumber(a: 30, b: 5))")

//함수 예제 2
//func largerNumbers(a: Int, b:Int) -> Int{
//    if a == b {
//        return 0
//    }
//    return a > b ? a : b
//}
//let a: Int = 5
//let b: Int = 9
//let c = largerNumbers(a: a, b:b)
//print(c)

//함수 예제 3
//func close10(a: Int, b:Int) ->Int{
//    print("1번째 수:", terminator: " ")
//    var a1 = Int(readLine()!)!
//    print("2번째 수:", terminator: " ")
//    var b1 = Int(readLine()!)!
//    a1 = 10 - a
//    b1 = 10 - b
//    if a1 == b1 {
//        return 0
//    }else {
//        return a1 > b1 ? b : a
//    }
//    
//}
//
//print("10에 가까운 수 :\(close10(a:9, b:5))")

//(2)직접 숫자 적용할 때
//func close10(a: Int, b:Int) ->Int{
// let a1 = 10 - a
// let b1 = 10 - b
//    if a1 == b1 {
//        return 0
//    }else {
//        return a1 > b1 ? b : a
//    }
//    
//}
//
//print("10에 가까운 수 :\(close10(a:9, b:5))")


//함수 예제 4
//func  powerN(base: Int, cnt :Int) -> Int {
//    var sum  = 1
//    for _ in 1...cnt {
//
//        sum *= base
//    }
//   return sum
//}
//
//let result = powerN(base: 2, cnt: 3)
//print(result)

//함수 예제 5
//func  getAbsoluteValue(a:Int , b:Int ) -> Int{
//    var result = 1
//       result =  abs(a - b)
//     
//    return result
//}
//
//let getValue = getAbsoluteValue(a: 5, b: 10)
//print("절대값: \(getValue)")

//함수 예제 6
//func isDivide(a:Int, b: Int ) -> Bool{
//    if a % b == 0 {
//      return true
//        
//    }else{
//        return false
//    }
//}
//
//let isResult = isDivide(a: 6, b: 7)
//print(isResult)

//함수 예제 7
func getDivisor(a: Int)-> Int {
    var result: Int = 0
    
    for i in 1...a {
        if  a  % i == 0 {
            
            result += i
            
            print(" \(i)",terminator: " ")
           
        }
       
    }
   return result
}

let result = getDivisor(a: 10)


//함수 예제 8
func getSumOfDivisors(a: Int)->Int {
    var result = 0
    for i in 1...a {
        if  a  % i == 0 {
            result += i
        }
        
    }
    return result
}

print(getSumOfDivisors(a: 10))


//함수 예제 9 -> 저금통
//1. 입금
//2. 잔액
//3. 출금

class MyBank {
    var curruntMoney:Int = 0
    var outMoney:Int = 0
    
    func inBankMoney (amount: Int) {
        curruntMoney += amount
        print("\(amount)가 입금되었습니다.")
    }
    
    func currentBankMoney (){
        print("현재 잔액은 \(curruntMoney) 입니다")
    }
    
    func outBankMoney (amount: Int) {
        if curruntMoney >= amount {
           curruntMoney -= amount
            print("\(amount)가 출금되었습니다.")
        }else {
            print("진액이 부족합니다.")
        }
        
    }
    
}

var myAccount = MyBank()

myAccount.inBankMoney(amount: 15000)//15000 입금
myAccount.currentBankMoney()//잔액 확인
myAccount.outBankMoney(amount: 3000)//3000원 출금
myAccount.currentBankMoney()//잔액확인
myAccount.outBankMoney(amount: 15000)//15000 출금 -> 거절 (잔액 부족)
