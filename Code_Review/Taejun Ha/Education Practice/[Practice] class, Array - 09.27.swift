
// Class 예제 06
//class TV {
//    var name: String
//    var year: Int
//    var size: Int
//
//    init(name: String, year: Int, size: Int) {
//        self.name = name
//        self.year = year
//        self.size = size
//    }
//
//    func show() -> String {
//        "\(name)에서 만든 \(year)년형 \(size)인치 TV"
//    }
//}
//
//let myTV = TV(name: "LG", year: 2023, size: 48)
//print( myTV.show())

// Array 예제 1
//
//var array = Array(repeating: 0, count: 10)
//
//for i in 0...array.count-1 {
//    array[i] = Int.random(in: 1...20)
//}
//
//print("array :",array.map{ String($0) }.joined(separator: " "))
//print("array[4] + array[9] :", array[4]+array[9])
//print("array의 합 :", array.reduce(0, +))
//print("array의 평균 :", array.reduce(0, +)/array.count)



// Array 예제 2
//
//var array = Array(repeating: 0, count: 10)
//
//for i in 0...array.count-1 {
//    array[i] = Int.random(in: 1...20)
//}
//
//print("array에 들어있는 짝수는", Array(array.filter{ $0%2 == 0 }), "입니다.")


// Array 에제 3
//
//var array = Array(repeating: 0, count: 10)
//
//for i in 0...array.count-1 {
//    array[i] = Int.random(in: 1...20)
//}
//
//let oddArray = Array(array.filter{ $0%2 == 1 })
//print("array에 들어있는 홀수는", oddArray, "이며, 총 \(oddArray.count)개 입니다.")


// Array 예제 4
//
//var array = Array(repeating: 0, count: 10)
//
//for i in 0...array.count-1 {
//    array[i] = Int.random(in: 1...20)
//}
//
//print("가장 큰 값은", array.sorted().last!, "입니다.")



// Array 예제 5
//
//var array = Array(repeating: 0, count: 10)
//
//for i in 0...array.count-1 {
//    array[i] = Int.random(in: 1...20)
//}
//
//print("가장 작은 값은", array.sorted().first!, "입니다.")



// Array 예제 6
//
//var strArray = ["수","박"]
//
//print("=== 수박 게임 시작! ===")
//print("숫자를 입력해주세요:", terminator: " ")
//
//for i in 0...Int(readLine()!)! - 1{
//    print(strArray[i%2], terminator: "")
//}




// Array 예제 7
//
//var array = Array(repeating: 0, count: 10)
//
//for i in 0...array.count-1 {
//    print("\(i+1)번 째 정수 입력:", terminator: " ")
//    array[i] = Int(readLine()!)!
//}
//
//print("3의 배수:", array.filter{ $0%3 == 0 }.map{ String($0) }.joined(separator: " "))



// Array 에제 8
//
//let answerArray = [1,1,4,2,3]
//var answerCheck = ""
//var answerScore = 0
//
//print("=== 체점하기! ===\n답을 입력하세요")
//
//for i in 1...answerArray.count {
//    print("\(i)번답: ",terminator: "")
//    if answerArray[i-1] == Int(readLine()!) {
//        answerCheck += "O "
//        answerScore += 5
//    } else {
//        answerCheck += "X "
//    }
//}
//
//print("정답확인\n\(answerCheck) 총점: \(answerScore)")




// Array 예제 9
//
//func printAsterisk(_ num: Int) -> String {
//    String(repeating: "*", count: num)
//}
//
//let array = [3,4,4,2,1]
//
//for i in 0...array.count-1 {
//    print("\(array[i]):", printAsterisk(array[i]))
//}

