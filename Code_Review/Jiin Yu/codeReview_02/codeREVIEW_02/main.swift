//
//  main.swift
//  codeREVIEW_02
//
//  Created by YOU on 2023/09/25.
//

import Foundation

//print("=== Plus Game ===")---------------->
    let randomNumberOne = Int.random(in: 1...5)
    let randomNumberTwo = Int.random(in: 1...5)
    var sumNumber: Int
    var pickedNumber: Int
    var isResult:Int

while true {
    print("합을 맞추세요: ", terminator: "")
    pickedNumber = Int(readLine()!)!
    //랜덤넘버 1,2 더하기
    sumNumber = randomNumberOne + randomNumberTwo
    //랜덤넘버의 합과 내가 고른 넘버의 합 체크 ---> 같다면
    if sumNumber == pickedNumber {
        print("Success! 숫자는 \(sumNumber) 입니다")
        print("계속 하시겠습니까? (Y/N): ", terminator: "")
    // 재도전 확인 유무
        if let ans = readLine(),ans.lowercased() == "n" {
            break
        }
    // 다르다면
    }else {
        print("Fail! 숫자는 \(sumNumber) 입니다")
        print("계속 하시겠습니까? (Y/N): ", terminator: "")
    //재도전 확인 유무
        if let ans = readLine(),ans.lowercased() == "n" {
            break
        }
    }
}


//정수를 입력 받아 1부터 입력 받은 정수까지 차례대로 출력하는 프로그램을 작성하시오.---------------->
//정수입력: 10
//1 2 3 4 5 6 7 8 9 10

print("정수 입력:" , terminator: "")
let input = Int(readLine()!)!

for i in 1...input {
    print( i , terminator:" ")
   
}



//한 개의 자연수를 입력 받아 그 수의 배수를 차례로 10개 출력하는 프로그램을 작성하시오.---------------->
//정수입력: 5
//5 10 15 20 25 30 35 40 45 50
print("정수 입력:", terminator: "")

var input = Int(readLine()!)!

for i in 1...10 {
    let sum = input * i
    print(sum, terminator: " ")
    
}



//1~100까지 3의 배수의 합을 출력하세요. (1683)---------------->
var numebr = 3
var sum = 0
for i in 1...100 {
    if i % 3 == 0 {
    sum += i
    }
    
}
print(sum)



//for 예제 4---------------->
//원하는 단을 입력 받아 구구단을 출력하세요.
print("단 입력:", terminator: "")
var input = Int(readLine()!)!
var sum = 0
for i in 1...9 {
   sum = input * i
    print("\(input) * \(i) = \(sum)")
}

////함수형!
//func  gugudan(input:Int, cnt:Int) {
//    for i in 1...cnt {
//        let sum = input * i
//        print("\(input) * \(i) = \(sum)")
//    }
//
//}
//
//gugudan(input: 2, cnt: 9)

//for 예제 5---------------->
//구구단 1단~9단까지 출력하세요
var sum = 0
for i in 1...9 {
print("===\(i)단===")
    for j in 1...9 {
        sum = i * j
        print("\(i) * \(j) = \(sum)")
    }
}




//for 예제 6
//구구단 1단~9단까지 출력하세요(가로 정렬?)
//내가 한거 + 꼭 다시 풀어보기
for i in 1...9 {
    print("\(i)단: ", terminator: "")
    for j in 1...9 {
        print("\(i) * \(j) = \(i * j)", terminator: "\t")
    }
    print()
}



//for 예제 7
//입력 받은 정수의 약수를 구하세요네
//정수입력: 32
//32의 약수: 1 2 4 8 16 32

print("정수 입력:", terminator: "" )

if let input = Int(readLine()!) {
    print("\(input)의 약수는: ", terminator: "")
    
    for i in 1...input {
        
        if input % i == 0 {
            
            var result = 0
            
            result += i
            
            print(result, terminator: " ")
            
        }
       
    }
    
    print()
}

//
//for 예제 8
//2~30까지의 약수를 구하세요
for i in 2...30 {
    print("\(i)의 약수는: ", terminator: "")
    
    for j in 1...i {
        var result = 0
       if i % j == 0 {
            print("\(j)", terminator: " ")
        }
    }
    print()
}


//for 예제 9
//다음과 같은 별 모양으로 출력하세요
//1
for i in 1...5 {
    for j in 1...i {
        print("*", terminator: "")
        
    }
    print()
}

print()
//2
for i in (1...5).reversed() {
    for j in 1...i {
        print("*", terminator: "")
        
    }
    print()
}

print()
//공백을+ 별

var number = 5
for s in 1...number {
    
    for _ in 1...(number - s ) {
        print(" ", terminator: "")
       }
    for  _ in 1...s {
        print("*", terminator: "")
    }
        print()
}



print()
//모래시계형 + 가운데 정렬?
for i in 1...5 {
    for _ in i...5{
        print(" ", terminator: "")
    }
    for _ in 1...i {
        print("**", terminator: "")
    }
    
    print("")
}

for i in (1...5).reversed() {
    for _ in i...5{
        print(" ", terminator: "")
    }
    for _ in 1...i {
        print("**", terminator: "")
    }
    
    print("")
}

//for 예제10
//369게임
//0부터 99까지
//333***
var array: [Int] = [33,36,39,63,66,69,93,96,99]
for i in 1...99 {

    print(i, terminator: "")
    if i % 3 == 0 {
        print("*", terminator: "")
        if array.contains(i) {
            print("*", terminator: "")
        }
        
    }
    print()
    
}
