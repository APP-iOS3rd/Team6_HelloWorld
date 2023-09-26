//
//  main.swift
//  codeREVIEW
//
//  Created by YOU on 2023/09/23.
//

import Foundation

//조건 1 금액 입력
//조건 2 메뉴 고르기
//조건 3 잔돈 출력하기


print("금액을 입력하세요:", terminator: "")
var money = Int(readLine()!)!

print("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원):", terminator: "")
var menu = Int(readLine()!)!

//돈이 부족하다는 것은 가진 돈에서 음료금액을 제외했을 때 음수가 됨
var checkedMoney =  money
// 유효성 검사
var isSelected = true

switch menu {
case 1 :
    checkedMoney -= 800
case 2 :
    checkedMoney -= 500
case 3 :
    checkedMoney -= 1500
default:
    print("음료를 선택해주세요 현재 금액은: \(money)")
    isSelected = false
    
}
//
////거스름돈 계산기
var th = checkedMoney / 1000
var fiveTh = (checkedMoney % 1000) / 500
var oneHun = ((checkedMoney % 1000) % 500) / 100

//0보다 작다는 것은 음수 -> 돈이 없다는 것
if isSelected == true {
    if checkedMoney < 0 {
        print("\(abs(checkedMoney))이 부족합니다.")
        
    }else {
        print("잔돈:\(checkedMoney) 그리고 음료가 나왔습니다")
        print("1000원 \(th)장 500원 \(fiveTh)개 100원 \(oneHun)개 입니다.")
    }
}

//500원으로 나눌 수 없다면?
//oneHun = ((checkedMoney % 1000) % 500) / 100 -> 거스름돈이 500원으로 나눌수 없으면 100원으로 넘어가는건가?


//-----------------------
//정수가 10 이하일때만 입력받게하고 10 이상이면 종료

print("정수를 입력하세요:", terminator: "")
var input = Int(readLine()!)!
var number: Int
number = input

while true {
    //입력 받는 부분이 while 문 안에 있어야 계속 10이하의 정수를 받을 수 있음
    print("정수를 입력하세요:", terminator: "")
    var input = Int(readLine()!)!
    number = input
    
    if number < 10 {
        continue
    } else {
        print("종료 되었습니다")
        break
    }
}


//-----------------------
//while 예제 2
//다이어트 관리 프로그램
//현재 몸무게와 목표몸무게를 입력 받고 주차 별 감량 몸무게를 입력 받으세요.
//목표 몸무게를 달성하면 축하한다는 문구를 출력 하고 입력을 멈추세요!

print("현재 몸무게를 입력하세요:", terminator: "")
var currentWeight = Int(readLine()!)!

print("목표 몸무게:", terminator: "")
var goalWeight = Int(readLine()!)!

var week = 1

while currentWeight > goalWeight {
    
print("\(week) 주차 감량 몸무게 :", terminator: "")
    
    if let lossWeight = Int(readLine()!) {
       currentWeight -= lossWeight
       week += 1
       continue
        
    }else {
       print("몸누게를 정확하게 입력하세요")
    }
}

if currentWeight <= goalWeight{
    
    print("목표 달성했습니다. 현재 몸무게 \(currentWeight) 입니다")
    
}


//-----------------------
//login프로그램
//로그인 프로그램을 만들어 보자.
//아이디와 비밀번호를 각각 입력 받고 일치할 경우 “로그인성공!”
//일치하지 않은 경우에는 “로그인 실패!”

let id = "hello"
let password = 1234

while true {
    print("아이디를 입력하세요:", terminator: "")
    if let userId = readLine() {
        print("비밀번호를 입력하세요:", terminator: "")
        if let userPassword = readLine(), let userPasswordInput = Int(userPassword) {
            if userId == id && userPasswordInput == password {
                print("로그인에 성공했습니다")
                break
            }else if userId != id {
                print("아이디가 클렸습니다.")
            }else if userPasswordInput != password {
                print("비밀번호가 틀렸습니다.")
            }else{
                print("다시 입력해주세요")
            }
        }
    }
}
