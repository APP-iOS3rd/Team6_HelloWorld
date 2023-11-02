//
//  main.swift
//  swift20230927
//
//  Created by 최준현 on 2023/09/27.
//

import Foundation

func randomArr()-> [Int]{
    var arr = [Int](repeating: 0, count:  10)
    
    for i in 0..<arr.count{
        arr[i] = Int.random(in: 1...20)
    }
    return arr
}

//Q1
func arr1(){
    let arr = randomArr()
    
    print(arr)
    print(arr[4]+arr[9])
    print(arr.reduce(0, +))
    print(Double(arr.reduce(0, +)/10))
}
//arr1()

//Q2
func arr2(){
    let arr = randomArr()
    print(arr)
    print(arr.filter{$0 % 2 == 0})
    
}
//arr2()

//Q3
func arr3(){
    let arr = randomArr()
    print(arr)
    print(arr.filter{$0 % 2 != 0})
}
//arr3()

//Q4
func arr4(){
    let arr = randomArr()
    var max = arr[0]
    print(arr)
//    print(arr.max()!)
    
    for i in arr{
        if i > max{
            max = i
        }
    }
    print(max)
}
//arr4()


//Q5
func arr5(){
    let arr = randomArr()
    var min = arr[0]
    print(arr)
//    print(arr.min()!)
    
    for i in arr{
        if i < min{
            min = i
        }
    }
    print(min)
}
//arr5()

//Q6
func arr6(){
    var arr : [String] = ["수","박"]
    print("=== 수박 게임 시작! ===")
    
    let input = Int(readLine()!)!
    
    if input % 2 == 0{
        arr += ["수","박"]
    }else{
        arr += ["수"]
    }
    
    print(arr.joined(separator: ""))
}
//arr6()

func arr7(){
    var arr = [Int](repeating: 0, count: 10)
    for i in 0..<arr.count{
        print("\(i+1)번째 정수 입력: ", terminator: "")
        let input = Int(readLine()!)!
        arr[i] = input
    }
    print("3의 배수: \(arr.filter{$0 % 3 == 0}.map({String($0)}).joined(separator: " "))")
}
//arr7()zzz

func arr8(){
    let arr: [Int] = [1, 1, 4, 2, 3]
    var answer: [String] = []
    var score = 0
    print("=== 채점하기! ===")
    print("답을 입력하세요")
    for i in 0..<arr.count{
        
        print("\(i+1)번답: ",terminator: "")
        let input = Int(readLine()!)!
        
        if arr[i] == input{
            answer += ["O"]
            score += 20
        }else{
            answer += ["X"]
        }
    }
    print("정답확인")
    print("\(answer.joined(separator: " ")) 총점: \(score)")
}
//arr8()



func arr9(){
    let arr = randomArr()
    print(arr)
    for i in arr{
        print("\(i): \(printStar(num: i))")
    }
}

func printStar(num: Int)->String{
    var str = ""
    for _ in 0..<num{
        str += "*"
    }
    return str
}
//arr9()
