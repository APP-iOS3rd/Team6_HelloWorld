//
//  main.swift
//  swift20230926
//
//  Created by 최준현 on 2023/09/26.
//


import Foundation

//func is369(cnt: Int) -> String{
//    let a = cnt / 10 //일이 아닌 자리(십의 자리 이상)
//    let b = cnt % 10 // 일의 자리
//    let str: String = (b % 3 == 0) && (b != 0) ? "*" : ""
//    if a == 0{
//        return str
//    }
//    
//    return str + is369(cnt: a)
//}
//
//for i in 0..<1000{
//    print("\(i)\(is369(cnt: i))")
//}


//함수예제1
//func addNumber(input1: Int, input2: Int ){
//    print("1번째 수: \(input1)")
//    print("2번째 수: \(input2)")
//    print("연산결과: \(input1 + input2)")
//}
//addNumber(input1: 30, input2: 5)


//함수예제2
//func largerNumber(input1: Int, input2: Int ){
//    var max = 0
//    print("1번째 수: \(input1)")
//    print("2번째 수: \(input2)")
//   
//    if input1 == input2 {
//        max = 0
//    }else{
//        max = input1 > input2 ? input1 : input2
//    }
//    print("큰 수 확인: \(max)")
//}
//
//largerNumber(input1: 2, input2: 5)

//함수예제3
//func close10(input1: Int, input2: Int)->Int{
//    print("1번째 수: \(input1)")
//    print("두번째 수: \(input2)")
//    var result = 0
//    var gap1 = 10 - input1
//    var gap2 = 10 - input2
//    
//    
//    if gap1 < 0{
//       gap1 = gap1 * -1
//    }
//    
//    if gap2 < 0{
//       gap2 = gap2 * -1
//    }
//    
//    if gap1 > gap2 {
//        result = input2
//    }else{
//        result = input1
//    }
//    
//    if(gap1 == gap2){
//        result = 0
//    }
//    
//    return result
//    
//    
//}
//let result = close10(input1: 8, input2: 12)
//print(result)
    
//함수예제4
//func powerN(base: Int, n: Int)->Decimal{
//    print("1번째 수: \(base)")
//    print("2번째 수: \(n)")
//    return (pow(Decimal(base),n))
//}
//let result = powerN(base: 2, n: 3)
//print("결과확인: \(result)")


//함수예제5
//let input = readLine()!.split(separator: " ").map{Int($0)!}
//let num1 = input[0]
//let num2 = input[1]
//
//func getAbsoluteValue(num1: Int, num2: Int)->Int{
//    print("첫 번째 수: \(num1)")
//    print("두 번째 수: \(num2)")
//    return num1 - num2 > 0 ? num1 - num2 : (num1 - num2) * -1
//}
//
//let result = getAbsoluteValue(num1: num1, num2: num2)
//print("결과 확인: \(result)")


//함수예제 6
func isDivide(num1: Int, num2: Int)->Bool{

    return num1 % num2 == 0 ? true : false
}



//함수예제7
func getDivisor(num: Int)->[Int]{
    var arr : [Int] = []
    for i in 1...num{
        if isDivide(num1: num, num2: i){
            arr.append(i)
        }
    }
    
    return arr
}


//함수예제8
func getSumOfDivisor(num: Int)->Int{
    let arr : [Int] = getDivisor(num: num)

    return arr.reduce(0, +)
}

//let input = Int(readLine()!)!
//let res = getSumOfDivisor(num: input)
//print("\(input) 약수의 합: \(res)")


//예제 9
//func isPerfectNumber(num: Int)->Bool{
//    var arr : [Int] = getDivisor(num: num)
//    arr.removeLast()
//
//    if(arr.reduce(0, +) == num){
//        return true
//    }else{
//        return false
//    }
//}
//
//func getPerfectNumber(startValue: Int, endValue: Int)->String{
//    var str = ""
//    for i in startValue...endValue{
//        if(isPerfectNumber(num: i)){
//            str += "\(i) "
//        }
//    }
//    return str
//}
//
//
//let result = getPerfectNumber(startValue: 2, endValue: 1000)
//print(result)


//예제 10
//func isPrime(num: Int) -> Bool {
//    
//    if num < 2  {
//        return false
//    }
//    for i in 2..<num {
//        if num % i == 0 { return false }
//    }
//    return true
//}
//
//
//func getPrimeNumber(startValue: Int, endValue: Int)->String{
//    var str = ""
//    for i in startValue...endValue{
//        if isPrime(num: i){
//            str += "\(i) "
//        }
//    }
//    return str
//}
//
//let str = getPrimeNumber(startValue: 2, endValue: 30)
//print(str)

//class PigBank{
//    var total = 0
//    
//    init( _ money: Int){
//        total = money
//    }
//    
//    func show(){
//        print("현재 잔액: \(total)")
//    }
//    
//    func deposit(money: Int){
//        total += money
//    }
//    func withdraw(money: Int){
//         total -= money
//         
//    }
//}
//
//let pig = PigBank(100)
//
//pig.deposit(money: 1700)
//pig.deposit(money: 500)
//pig.show()
//
//pig.withdraw(money: 500)
//pig.show()

class Student{
    let name: String
    let number: String
    let age: Int
    let scoreSwift: Int
    let scoreiOS: Int
    let scoreWeb: Int
    
    init(name: String, number: String, age: Int, scoreSwift: Int, scoreiOS: Int, scoreWeb: Int) {
        self.name = name
        self.number = number
        self.age = age
        self.scoreSwift = scoreSwift
        self.scoreiOS = scoreiOS
        self.scoreWeb = scoreWeb
    }
    
    func show(){
        print("\(self.name)님 안녕하세요.")
        print("[ \(self.number), \(self.age)살 ]")
        print("\(self.name)님의 Swift 점수는 \(self.scoreSwift)점 입니다.")
        print("\(self.name)님의 iOS 점수는 \(self.scoreiOS)점 입니다.")
        print("\(self.name)님의 Web 점수는 \(self.scoreWeb)점 입니다.")
        print()
    }
}

//let student1 = Student(
//    name: "홍길동",
//    number: "20200677",
//    age: 22,
//    scoreSwift: 50,
//    scoreiOS: 89,
//    scoreWeb: 77
//)
//student1.show()
//
//let student2 = Student(
//    name: "김영희",
//    number: "20190541",
//    age: 26,
//    scoreSwift: 90,
//    scoreiOS: 85,
//    scoreWeb: 70
//)
//student2.show()

class Person{
    private var age: Int
    private var name: String
    
    init(name: String, age: Int) {
        self.name = name 
        self.age = age
    }
    
    func getName()->String{
        return name
    }
    
    func setName(newName: String){
        name = newName
    }
    
    func getAge()->Int{
        return age
    }
    
    func setAge(newAge: Int){
        age = newAge
    }
    func show()->String{
        return "이름: \(self.getName()) 나이: \(self.getAge())"
    }
}

//let p1 = Person(name: "홍길동", age: 25)
//let p2 = Person(name: "김영희", age: 27)
//print(p1.show())
//print(p2.show())

class Calculator{
    private var num1: Int
    private var num2: Int
    
    
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    
    func setNum1(newNum1: Int){
        num1 = newNum1
    }
    func setNum2(newNum2: Int){
        num2 = newNum2
    }
    
    
    func sum()->Int{
        return num1 + num2
    }
    
    func sub()->Int{
        return num1 - num2
    }
    
    func mul()->Int{
        return num1 * num2
    }
    
    func div()->Double{
        return Double(num1) / Double(num2)
    }
    
}

//let cal = Calculator(num1: 7, num2: 5)
//print(cal.sum())
//cal.setNum1(newNum1: 75)
//cal.setNum2(newNum2: 5)
//print("빼기: \(cal.sub()) 곱하기: \(cal.mul()) 나누기: \(cal.div())")

class TV{
    private var name: String
    private var year: Int
    private var size: Int
    
    init(name: String, year: Int, size: Int) {
        self.name = name
        self.year = year
        self.size = size
    }
    func show()->String{
        return "\(name)에서 만든 \(year)년형 \(size)인치 TV"
    }
}

let myTV = TV(name: "LG", year: 2023, size: 48)
print(myTV.show())



