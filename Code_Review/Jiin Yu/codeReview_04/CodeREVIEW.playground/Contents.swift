import UIKit


//Class 예제 01
//
//학생정보 관리
//학생의 정보를 담을 수 있는 Student 클래스를 작성하세요
//Student클래스는 다음과 같은 필드를 갖습니다
//class Student {
//    var name : String = ""
//    var age : String = ""
//    var number : String = ""
//    var score1 :Int = 0
//    var score2 :Int = 0
//    var score3 :Int = 0
//    
//    //학생 정보를 출력하는 함수
//    func show ()  -> String {
//        "\(name)님 안녕하세요. [ \(number), \(age)살 ] \(name)의 Swift 점수는 \(score1)점 입니다. \(name)의 iOS 점수는 \(score2)점 입니다. \(name)님의 Web 점수는 \(score3)점 입니다."
//    }
//}
////값 변경
//var myStudent = Student()
//myStudent.name = "새로운 이름"
//
//
////Class 예제 02
////
////학생정보 관리
////각각 student1, student2 객체(인스턴스)를 생성하고
////다음과 같이 초기화하세요
//
//var student1 = Student()
//student1.name = "미츠하"
//student1.age = "19"
//student1.number = "2000"
//student1.score1 = 90
//student1.score2 = 90
//student1.score3 = 90
//student1
//
//var student2 = Student()
//student2.name = "하울"
//student2.age = "29"
//student2.number = "2000"
//student2.score1 = 100
//student2.score2 = 100
//student2.score3 = 100
//student2
//
//Class 예제 03
//
//학생정보 관리
//초기화한 학생의 정보를 화면에 출력하는 show()메소드를
//Student 클래스 안에 작성하고 호출하여 학생의 정보를 입력
//student1.show()




//Class 예제 04
//
//Person 클래스를 작성하세요
//Person 클래스는 다음과 같은 프로퍼티와, 메소드를 가지고 있습니다
//속성(프로퍼티) : 접근지정자, 타입, 변수명, 설명
//이름 (name)
//나이 (age)
//기능(메소드) : 이름, 리턴타입, 매개변수, 설명
//이름과 나이로 초기화 한다 (init)
//이름을 가져온다 getName
//이름을 저장 또는 변경한다 setName
//나이를 가져온다 getAge
//나이를 저장 또는 변경한다 setAge
//
//class Person {
//    var name : String = ""
//    var age : Int = 0
//    
//    init() {
//        self.name = "no name"
//        self.age = 0
//    }
//    init(name: String, age:Int) {
//        self.name = name
//        self.age = age
//    }
//    
//    func getName() -> String {
//        return name
//    }
//    func setName(name: String) {
//        self.name = name
//    }
//    func getAge() ->Int{
//        return age
//    }
//    func setAge(age: Int) {
//        self.age = age
//    }
//    
//    //return 값을 넣어줌으로, newPerson1.show() 의 값을 받을 수 있음
//    func show() -> String {
//       return "학생 이름: \(name), 학생 나이 \(age) 입니다 "
//    }
//}
//
////Class 예제 04-1
////
////Person 클래스를 작성하세요
////2개의 매개변수를 넘겨받는 초기화를 이용해 이름과 나이로 객체 person1를 생성하세요.
////2개의 매개변수를 넘겨받는 초기화를 이용해 이름과 나이로 객체 person2를 생성하세요.
////두 사람 객체의 이름과 나이를 아래와 같이 출력하세요.
//
//var newPerson1 = Person(name: "Michuha", age: 19)
//var newPerson2 = Person(name: "Otoru", age: 19)
//print("새로운 학생", newPerson1.show())
//
//
//Class 예제 05
//
//Calculator 클래스를 작성하세요.
//Calculator 클래스는 다음과 같은 필드와 다음과 같은 메소드를 가지고 있습니다.
//속성(프로퍼티) : 접근지정자, 타입, 변수명, 설명
//첫 번째 정수 (num1)
//두 번째 정수 (num2)
//기능(메소드) : 이름, 리턴타입, 매개변수, 설명
//두 정수를 가지고 초기화 한다 (init)
//num1 값을 저장 및 변경 한다 (setNum1)
//num2 값을 저장 및 변경 한다 (setNum2)
//num1 + num2 값을 반환 (sum)
//num1 - num2 값을 반환 (sub)
//num1 * num2 값을 반환 (mul)
//num1 / num2 값을 반환 (div)
//class Calculator {
//    var num1 : Int = 0
//    var num2 : Int = 0
//    
//    init(num1: Int, num2: Int) {
//        self.num1 = num1
//        self.num2 = num2
//    }
//    func setNum1 (num1: Int) {
//        self.num1 = num1
//    }
//    func setNum2 (num2: Int)  {
//        self.num2 = num2
//    }
//    
//    func sum () -> Int{
//        return num1 + num2
//    }
//    func sub () -> Int{
//        return num1 - num2
//    }
//    func mul () -> Int{
//        return num1 * num2
//    }
//    func div () -> Int{
//        return num1 / num2
//    }
//    
//}
//
//Class 예제 05-1
//
//Calculator 클래스를 작성하세요.
//2개의 매개변수를 넘겨받는 초기화를 이용해 객체 cal을 만드세요.
//cal객체의 num1과 num2를 더한 값을 출력하세요.
//cal객체의 num1값은 75, num2의 값은 5로 수정하세요.
//cal객체의 num1과 num2를 뺀 값, 곱한 값, 나눈 값을 출력하세요.
//var myCal = Calculator(num1: 10, num2: 5)
//myCal.sum() // +
//myCal.num1 = 75
//myCal.num2 = 5
//myCal.sub() // -
//myCal.mul() // *
//myCal.div() // /
//
//Class 예제 06
//
//다음 예시와 같이 출력되도록 TV 클래스를 작성하세요.
//
//
//class Tv {
//    var name: String = ""
//    var year: Int = 0
//    var inch:Int = 0
//    func show () ->String {
//        return "\(name)에서 만든 \(year)년형 \(inch)인치 TV"
//    }
//}
//var newTv = Tv()
//newTv.name = "LG"
//newTv.year = 2023
//newTv.inch = 48
//print(newTv.show())


//var items: [Int] = [0,1,2,3,4]
//items.count //갯수 확인
//items.append(15)
//items.append(12)//배열의 맨 뒤에 추가하기
//items.insert(13, at: 2)//특정 자리에 넣기 : 인덱스 2번에 13 넣기 그러면서 숫자가 하나씩 밀림
//items.isEmpty//배열이 비었는지 아닌지 확인
//items.first// 배열의 0번째 인덱스 확인
//items.removeLast()//인덱스의 마지막번째 삭제

//예제 1
var arrayNumbers:[Int] = []

for _ in 1...10 {
    var randomNumbers = Int.random(in: 1...20)
    arrayNumbers.append(randomNumbers)

}
//데이터 전체 출력
print(arrayNumbers)

//4번째 인덱스 +9번째 인덱스
print(arrayNumbers[4] + arrayNumbers[9])

//데이터 결과 값
var ar:Int = 0
func arraySum() ->Int {
    for _ in 1...10 {
        var randomN = Int.random(in: 1...20)
        ar += randomN
    }
    return ar
}
print(arraySum())

//데이터 평균 값
print(Float(arraySum() / 10))



//예제 2
//정수 배열 짝수 출력

//var arrayNumber: [Int] = []
//
//while arrayNumber.count < 5 {
//    var randomN = Int.random(in: 1...10)
//    if randomN  % 2 == 0 {
//       
//        //중복확인은 배열에 넣기 전에 해야함
//        if arrayNumber.contains(randomN) {
//            continue
//        }
//    
//        arrayNumber.append(randomN)
//    }
//}
//
//print("배열에 들어있는 짝수는 \(arrayNumber.sorted()) 입니다.")


//예제 3
var arrayNums = [1,2,3,4,5,6,7,8,9,10]
var oddNum = arrayNums.filter{ !($0 % 2 == 0)}
print("array에 들어있는 홀수는 \(oddNum)이고, 총 \(oddNum.count)개 입니다.")


//예제 4 정수형 배열에서 가장 큰 수 출력
var arrayNumber: [Int] = []
for _ in 1...10 {
    var randomN = Int.random(in: 1...10)
    arrayNumber.append(randomN)

}

let sortedArray = arrayNumber.sorted()
var maxN: Int = 0
//옵셔널 처리
if let lastValue = sortedArray.last {
    maxN = lastValue
    print("배열에서 가장 큰 수는 \(maxN)입니다")
}else {
    print("배열이 비어있습니다")
}
    
//예제 5
var newArray : [Int] = []

for _ in 1...10 {
    var randomNumber = Int.random(in: 1...10)
    newArray.append(randomNumber)
   
}

var sortedArr =  newArray.sorted()
var minN:Int = 0

if let firstNumber = sortedArr.first {
    minN = firstNumber
    print(minN)
    print("배열에서 가장 작은 수는 \(minN)입니다")
}else {
    print("???")
}

//예제 6
//짝수 수박 홀수 수박수
var waterM : [String] = ["수", "박"]
print("숫자를 입력하세요:", terminator: "")
var array = ""
var cnt = 0
if let input = readLine(), let number = Int(input) {
    var num1 = number
    if num1 % 2 == 0 {
       
        let str = String(repeating: waterM.joined(), count: num1/2)
        array = str
        print(array)
    }else {
        let str = String(repeating: waterM.joined(), count: num1/2)
        array = str + waterM[0]
        print(array)
    }
}


//예제 7

var num: Int = 1
var nums : Int = 0
var newNums: [Int] = []

for _ in 1...10 {
    print("\(num)번째의 정수를 입력하세요: ", terminator: "")
    
    if  let input = Int(readLine()!) {
        num += 1
        nums += input
        
        if input % 3 == 0 {
            newNums.append(input)
        }
    }
    print()
}

print("3의 배수인 정수: \(newNums)")


//예제 8
var n = 1
var originAns = [1, 1, 4, 2, 3]
var newAns: [String] = []
var cnt = 0
var grade = 0
for i in 0..<originAns.count {
    print("\(n)번 답: ", terminator: "")
    
    if let input = Int(readLine()!) {
        if originAns[i] == input {
            newAns.append("O")
            cnt += 1
        }else {
            
            newAns.append("X")
        }
        
        n += 1
    }
        grade =  cnt * 20
}

print("\(newAns) 총점은: \(grade)")

//예제 9

var starArray = [3, 4, 4, 2, 1]
var star = "*"
var howMany = ""

for i in 0..<starArray.count {
        howMany = String(repeating: star, count: starArray[i] )
    print("\(starArray[i]): \(howMany)")
   }
