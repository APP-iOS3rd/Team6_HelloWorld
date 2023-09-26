import Foundation
//
//var msg = "1+2-3*4/5"
//
//let arr = msg.components(separatedBy: ["+","-","*","/"]).map{Int($0)!}
//
//print(arr)
//
//print(arr[0] + arr[1])
//
//
//print("asdf", "asdf")

//var count = 1
//count += 2
//print(count)




//print("금액을 입력하세요.")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요\n1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : ",terminator: "")
//let menu = Int(readLine()!)! - 1
//let price = [800, 500, 1500]
//print("잔돈: \(money >= price[menu] ? "\(money - price[menu])" : "돈이 부족해요ㅠㅠ\n잔돈: \(money)원")")
//
//money -= price[menu]
//let t = money / 1000
//money %= 1000
//let fh =  money / 500
//money %= 500
//let oh = money / 100
//print("천원: \(t)개, 오백원: \(fh)개, 백원: \(oh)개")



// while 예제 2
//print("현재 몸무게: ",terminator: "")
//var currentWeight = Int(readLine()!)!
//print("목표 몸무게: ",terminator: "")
//let goalWeight = Int(readLine()!)!
//
//var week = 1
//while(currentWeight > goalWeight) {
//    print("\(week)주차 감량 몸무게: ", terminator: "")
//    currentWeight -= Int(readLine()!)!
//    week += 1
//}
//print("\(currentWeight)kg 달성! 축하합니다!!")

// while 예제 3
//let userID = "Hello"
//let password = 1234
//
//var check = [false, false]
//print("아이디를 입력해 주세요: ",terminator: "")
//check[0] = ((userID == readLine()!) ? true : false)
//print("비밀번호를 입력해 주세요: ", terminator: "")
//check[1] = ((password == Int(readLine()!)!) ? true : false)
//
//print(check[0]&&check[1] ? "로그인 성공!" : "아이디와 비밀번호가 잘못되었습니다.")

// while 예제 4
//
//let userID = "Hello"
//let password = 1234
//
//var check = [false, false]
//
//repeat {
//    print("아이디를 입력해 주세요: ",terminator: "")
//    check[0] = ((userID == readLine()!) ? true : false)
//    print("비밀번호를 입력해 주세요: ", terminator: "")
//    check[1] = ((password == Int(readLine()!)!) ? true : false)
//    print(check[0]&&check[1] ? "" : "아이디와 비밀번호가 잘못되었습니다.\n\n",terminator: "")
//} while(!(check[0]&&check[1]))
//
//print("로그인 성공!")



//while 예제 5
//let userID = "Hello"
//let password = 1234
//
//var check = [false, false]
//var checkLogin: Bool = false
//
//repeat {
//    print("아이디를 입력해 주세요: ",terminator: "")
//    check[0] = ((userID == readLine()!) ? true : false)
//    print("비밀번호를 입력해 주세요: ", terminator: "")
//    check[1] = ((password == Int(readLine()!)!) ? true : false)
//
//    checkLogin = check[0]&&check[1]
//
//    print(checkLogin ? "" : "아이디와 비밀번호가 잘못되었습니다.\n",terminator: "")
//
//    if !(checkLogin) {
//        print("계속 하시겠습니까? (Y/N) ",terminator: "")
//        if readLine()! == "N" {
//            break
//        }
//        print()
//    }
//} while(!(checkLogin))
//
//if checkLogin {
//    print("로그인 성공!")
//}
//print("\n종료되었습니다.")


//while 예제 6
//var repeatAns = ""
//repeat {
//    print("첫 번째 정수를 입력하세요: ",terminator: "")
//    let firstNum = Int(readLine()!)!
//    print("두 번째 정수를 입력하세요: ",terminator: "")
//    let secondNum = Int(readLine()!)!
//
//    print("1.더하기 2.빼기 : ",terminator: "")
//    let select = Int(readLine()!)!
//
//    switch select {
//    case 1:
//        print("더하기 연산 결과는 \(firstNum + secondNum)입니다.")
//    case 2:
//        print("빼기 연산 결과는 \(firstNum - secondNum)입니다.")
//    default:
//        print()
//    }
//
//    print("다시 실행 하시겠습니까? (Y/N) ", terminator: "")
//    repeatAns = readLine()!
//    print()
//} while(repeatAns == "Y")
//
//print("종료되었습니다.")



// while 예제 7 - 1
//var restart = false
//var answerCheck = true
//var number1: Int = 0
//var number2: Int = 0
//repeat {
//    if answerCheck {
//        print("=== Plus Game ===")
//        number1 = (0...50).randomElement()!
//        number2 = (0...50).randomElement()!
//    }
//    print("\(number1)+\(number2)= ",terminator: "")
//    let answer = Int(readLine()!)!
//    if number1+number2 == answer {
//        print("Success")
//    } else {
//        print("Fail")
//    }
//
//    print("계속 하시겠습니까? (Y/N) ",terminator: "")
//    restart = (readLine()! == "Y" ? true : false)
//    answerCheck = (number1+number2 == answer ? true : false)
//}while(restart)


// while 예제 7-2
//var restart = false
//repeat {
//    print("=== Plus Game ===")
//    let number1 = (0...50).randomElement()!
//    let number2 = (0...50).randomElement()!
//
//    print("\(number1)+\(number2)= ",terminator: "")
//
//    if number1+number2 == Int(readLine()!)! {
//        print("Success")
//    } else {
//        print("Fail")
//    }
//
//    print("계속 하시겠습니까? (Y/N) ",terminator: "")
//    restart = (readLine()! == "Y" ? true : false)
//
//}while(restart)


// for 예제 00
//for i in (53...96).reversed() {
//    print(i)
//}


//for i in 21...57 {
//    guard i%2 == 1 else {continue}
//    print(i)
//}

//print("정수 입력: ",terminator: "")
//for i in 1...Int(readLine()!)!{
//    print(i,terminator: " ")
//}

//print("정수 입력: ",terminator: "")
//let n = Int(readLine()!)!
//for i in 1...10 {
//    print(n*i, terminator: " ")
//}

//var answer = 0
//for i in 1...100 {
//    guard i%3 == 0 else { continue }
//    answer += i
//}
//
//print("3의 배수의 합 : \(answer)")




// for 예제 3
//
//for i in 1...9 {
//    print("2 * \(i) = \(2*i)")
//}

// for 예제 4
//print("단 입력: ",terminator: "")
//let n = Int(readLine()!)!
//for i in 1...9 {
//    print("\(n) * \(i) = \(n*i)")
//}


// for 예제 5
//
//for i in 1...9 {
//    print("===\(i)단===")
//    for j in 1...9 {
//        print("\(i) * \(j) = \(i*j)")
//    }
//    print()
//}


// for 예제 6
//for i in 1...9 {
//    print("\(i)단:",terminator: " ")
//    for j in 1...9 {
//        print("\(i) * \(j) = \(i*j)", terminator: (i*j < 10 ? "     ":"    "))
//    }
//    print()
//}


// for 예제 7

//print("정수입력:", terminator: " ")
//let n = Int(readLine()!)!
//
//print("\(n)의 약수:", terminator: " ")
//for i in 1...n{
//    guard n%i == 0 else {continue}
//    print(i,terminator: " ")
//}


// for 예제 8
//let divisor = {(n: Int) -> Void in
//    print("\(n)의 약수:",terminator: " ")
//    for i in 1...n{
//        guard n%i == 0 else {continue}
//        print(i,terminator: " ")
//    }
//    print()
//}
//
//
//for i in 2...30 {
//    divisor(i)
//}


// for 예제 9

//(1)
//let asteriskPrint = {(n: Int) -> Void in
//    print(String(repeating: "*", count: n),terminator: "\n")
//}
//
//for i in 1...5 {
//    asteriskPrint(i)
//}


//(2)
//let asteriskPrint = {(n: Int) -> Void in
//    print(String(repeating: "*", count: n),terminator: "\n")
//}
//
//for i in (1...5).reversed() {
//    asteriskPrint(i)
//}


//(3)
//let spacePrint = {(n: Int) -> Void in
//    print(String(repeating: " ", count: n),terminator: "")
//}
//
//let asteriskPrint = {(n: Int) -> Void in
//    print(String(repeating: "*", count: n),terminator: "")
//}
//
//let n = 5
//for i in (1...n) {
//    spacePrint(n-i)
//    asteriskPrint(i)
//    print()
//}


//(4)
//4_2_4
//3_4_3
//2_6_2
//1_8_1
//0_10_0
//1_8_1
//2_6_2
//3_4_3
//4_2_4

//let spacePrint = {(n: Int) -> Void in
//    print(String(repeating: " ", count: n),terminator: "")
//}
//
//let asteriskPrint = {(n: Int) -> Void in
//    print(String(repeating: "*", count: n),terminator: "")
//}
//
//var flag = 4
//for i in Array(repeating: 10, count: 5) {
//    spacePrint(flag)
//    asteriskPrint(i - flag*2)
//    spacePrint(flag)
//    flag -= 1
//    print()
//}
//
//flag = 0
//for i in Array(repeating: 10, count: 5) {
//    spacePrint(flag)
//    asteriskPrint(i - flag*2)
//    spacePrint(flag)
//    flag += 1
//    print()
//}


// for 예제 10
//var answer: [String] = Array(repeating: "", count: 100)
//
//for i in 0...9 {
//    for j in 0...9{
//        let index = Int(String(i)+String(j))!
//        answer[index].append(String(i))
//        answer[index].append(String(j))
//        if j != 0 && j % 3 == 0 {
//            answer[index].append("*")
//        }
//        if i != 0 && i % 3 == 0 {
//            answer[index].append("*")
//        }
//    }
//}
//
//print(answer.joined(separator: "\n"))








// 함수 예제 1
//func addNumber(x: Int, y: Int) -> Int {
//    x + y
//}
//
//print("1번째 수: ",terminator: "")
//let x = Int(readLine()!)!
//print("2번째 수 : ",terminator: "")
//let y = Int(readLine()!)!
//print("연산결과: \(addNumber(x: x, y: y))")


// 함수 예제 2
//func largerNumbers(x: Int, y: Int) -> Int {
//    guard x != y else {return 0}
//    return x > y ? x : y
//}
//
//print("1번째 수: ",terminator: "")
//let x = Int(readLine()!)!
//print("2번째 수 : ",terminator: "")
//let y = Int(readLine()!)!
//print("큰 수 확인: \(largerNumbers(x: x, y: y))")


// 함수 예제 3
//func close10(x: Int, y: Int) -> Int {
//    let absX = abs(10-x)
//    let absY = abs(10-y)
//    guard absX != absY else {return 0}
//    return (absX < absY ? x : y)
//}
//
//print("1번째 수: ",terminator: "")
//let x = Int(readLine()!)!
//print("2번째 수 : ",terminator: "")
//let y = Int(readLine()!)!
//print("10에 가까운 수: \(close10(x: x, y: y))")




// 함수 예제 4
//import Foundation
//
//func powerN(x: Decimal, y: Int) -> Decimal {
//    pow(x, y)
//}
//
//print("1번째 수: ",terminator: "")
//let x = Decimal(Int(readLine()!)!)
//print("2번째 수 : ",terminator: "")
//let y = Int(readLine()!)!
//print("결과 확인: \(powerN(x: x, y: y))")



// 함수 예제 5
//func getAbsoluteValue(x: Int, y: Int) -> Int {
//    abs(x-y)
//}
//
//print("1번째 수: ",terminator: "")
//let x = Int(readLine()!)!
//print("2번째 수 : ",terminator: "")
//let y = Int(readLine()!)!
//print("결과 확인: \(getAbsoluteValue(x: x, y: y))")



// 함수 예제 6
//func isDivide(x: Int, y: Int) -> Bool {
//    x % y == 0 ? true : false
//}
//
//print("1번째 수: ",terminator: "")
//let x = Int(readLine()!)!
//print("2번째 수 : ",terminator: "")
//let y = Int(readLine()!)!
//print("결과 확인: \(isDivide(x: x, y: y))")



// 함수 예제 7
//func getDivisor(n: Int) -> [Int] {
//    var arr: [Int] = []
//    for i in 1...n {
//        if n%i == 0 {
//            arr.append(i)
//        }
//    }
//    return arr
//}
//
//let numberArray = [10, 16, 24]
//
//for i in numberArray {
//    print("\(i)의 약수: \(getDivisor(n: i).map{ String($0) }.joined(separator: " "))")
//}


// 함수 예제 8
//func getDivisor(n: Int) -> Int {
//    var arr: [Int] = []
//    for i in 1...n {
//        if n%i == 0 {
//            arr.append(i)
//        }
//    }
//    return arr.reduce(0, +)
//}
//
//let numberArray = [10, 16]
//
//for i in numberArray {
//    print("\(i)의 약수의 합: \(getDivisor(n: i))")
//}






// 함수 예제 9
// 자기 자신을 제외한 약수의 합
//func getDivisor(n: Int) -> Int {
//    var arr: [Int] = []
//    for i in 1...n-1 {
//        if n%i == 0 {
//            arr.append(i)
//        }
//    }
//    return arr.reduce(0, +)
//}
//
//func getPerfectNumber(range: ClosedRange<Int>){
//    print("\(range.first!)~\(range.last!)까지의 완전수: ",terminator: "")
//    for i in range {
//        if getDivisor(n: i) == i {
//            print(i, terminator: " ")
//        }
//    }
//}
//
//let startValue = 2
//let endValue = 1000
//
//getPerfectNumber(range: startValue...endValue)



// 함수 예제 10
//func primeCheck(n: Int) -> Bool {
//    guard n != 2 else { return true }
//
//    for i in 2...n-1 {
//        if n%i == 0 {
//            return false
//        }
//    }
//    return true
//}
//
//func getPrimeNumber(range: ClosedRange<Int>) {
//    print("\(range.first!)~\(range.last!)까지의 소수: ",terminator: "")
//
//    range.forEach{
//        if primeCheck(n: $0) {
//            print($0, terminator: " ")
//        }
//    }
//
//}
//
//let startValue = 2
//let endValue = 30
//
//getPrimeNumber(range: startValue...endValue)



//class PiggyBank {
//    var money: Int
//    var size: Int
//    
//    init(_ money: Int,_ size: Int) {
//        self.money = money
//        self.size = size
//    }
//    
//    func deposit(_ money: Int){
//        if size < self.money + money{
//            print("저금통이 가득 찼습니다.")
//            print("반환 금액: \(self.money + money - size)")
//            self.money = size
//            show()
//        } else {
//            self.money += money
//            self.show()
//        }
//    }
//    func withDraw(_ money: Int) {
//        if self.money >= money {
//            self.money -= money
//            self.show()
//        } else {
//            print("잔액이 부족합니다.")
//        }
//    }
//    
//    func show() {
//        print("현재 잔액: \(money)")
//    }
//}
//
//
//let myPig = PiggyBank(0, 100000)
//
//var flag = true
//repeat{
//    print("0.종료 1.저금 2.인출 3.현재잔액 : ", terminator: "")
//
//    switch readLine()! {
//    case "1":
//        print("저금할 금액: ", terminator: "")
//        myPig.deposit(Int(readLine()!)!)
//    case "2":
//        print("인출할 금액: ", terminator: "")
//        myPig.withDraw(Int(readLine()!)!)
//    case "3":
//        myPig.show()
//    default:
//        flag = false
//    }
//    print()
//} while(flag)









// class 예제 03
//class Student {
//    var name: String
//    var number: String
//    var age: Int
//    var scoreSwift: Int
//    var scoreiOS: Int
//    var scoreWeb: Int
//
//    init(name: String, number: String, age: Int, scoreSwift: Int, scoreiOS: Int, scoreWeb: Int) {
//        self.name = name
//        self.number = number
//        self.age = age
//        self.scoreSwift = scoreSwift
//        self.scoreiOS = scoreiOS
//        self.scoreWeb = scoreWeb
//    }
//
//    func getName() -> String {
//        name
//    }
//
//    func getNumber() -> String {
//        number
//    }
//
//    func getAge() -> Int {
//        age
//    }
//
//    func getScoreSwift() -> Int {
//        scoreSwift
//    }
//
//    func getScoreiOS() -> Int {
//        scoreiOS
//    }
//
//    func getScoreWeb() -> Int {
//        scoreWeb
//    }
//
//    func show() {
//        print("\(name)님 안녕하세요.")
//        print("[ \(number), \(age)살 ]")
//        print("\(name)님의 Swift 점수는 \(scoreSwift)점 입니다.")
//        print("\(name)님의 iOS 점수는 \(scoreiOS)점 입니다.")
//        print("\(name)님의 Web 점수는 \(scoreWeb)점 입니다.")
//    }
//}
//
//let student1 = Student(name: "홍길동", number: "20200677", age: 22, scoreSwift: 50, scoreiOS: 89, scoreWeb: 77)
//
//let student2 = Student(name: "김영희", number: "20190541", age: 26, scoreSwift: 90, scoreiOS: 85, scoreWeb: 70)
//
//
//student1.show()
//print("======================================")
//student2.show()




// class 예제 04
//class Person {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func getName() -> String {
//        name
//    }
//
//    func setName(_ n: String) {
//        name = n
//    }
//
//    func getAge() -> Int {
//        age
//    }
//
//    func setAge(_ a: Int) {
//        age = a
//    }
//}
//
//let st1 = Person(name: "하태준", age: 25)
//let st2 = Person(name: "김영희", age: 27)
//
//print("st1 객체 학생 이름: \(st1.getName()), 나이: \(st1.getAge())")
//print("st2 객체 학생 이름: \(st2.getName()), 나이: \(st2.getAge())")




// class 예제 05
//class Calculator {
//    var num1: Int
//    var num2: Int
//
//    init(num1: Int, num2: Int) {
//        self.num1 = num1
//        self.num2 = num2
//    }
//
//    func setNum1(_ n: Int){
//        num1 = n
//    }
//
//    func setNum2(_ n: Int){
//        num2 = n
//    }
//
//    func sum() -> Int {
//        num1 + num2
//    }
//
//    func sub() -> Int {
//        num1 - num2
//    }
//
//    func mul() -> Int {
//        num1 * num2
//    }
//
//    func div() -> Int {
//        num1 / num2
//    }
//
//    func show() {
//        print("num1: \(num1), num2: \(num2)")
//    }
//}
//
//let n = Calculator(num1: 10, num2: 5)
//
//n.show()
//print("Sum: \(n.sum())\n")
//
//
//n.setNum1(75)
//n.setNum2(5)
//n.show()
//
//print("Sub: \(n.sub()), Mul: \(n.mul()), Div: \(n.div())")
