// 열거형 예제 06
//
//enum Direction {
//    case right
//    case left
//    case up
//    case down
//}
//
//func move(position: (x: Int, y: Int), direction: Direction) -> (x: Int, y: Int) {
//    let (x, y) = (position.x, position.y)
//    switch direction {
//    case .right: return (x + 1, y)
//    case .left: return (x - 1, y)
//    case .up: return (x, y + 1)
//    case .down: return (x, y - 1)
//    }
//}
//
//let currentPosition = (x: 0, y: 0)
//
//var nextPosition = move(position: currentPosition, direction: .right)
//print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (1, 0)입니다.
//
//nextPosition = move(position: currentPosition, direction: .left)
//print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (-1, 0)입니다.
//
//nextPosition = move(position: currentPosition, direction: .up)
//print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, 1)입니다.
//
//nextPosition = move(position: currentPosition, direction: .down)
//print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, -1)입니다.




// 열거형 예제 07
//
//enum Dice {
//    case one
//    case two
//    case three
//    case four
//    case five
//    case six
//    case outOfRange
//}
//
//func rollDice() -> Dice {
//    switch Int.random(in: 1...6) {
//    case 1: return .one
//    case 2: return .two
//    case 3: return .three
//    case 4: return .four
//    case 5: return .five
//    case 6: return .six
//    default: return .outOfRange
//    }
//}
//
//let dice = rollDice()
//
//print("주사위의 면은 \(dice)입니다.")   // 주사위의 면은 two입니다.

// 실행할 때마다 다음 6가지 경우중 랜덤하게 출력
// 주사위의 면은 one입니다.
// 주사위의 면은 three입니다.
// 주사위의 면은 four입니다.
// 주사위의 면은 five입니다.
// 주사위의 면은 six입니다.





// 열거형 예제 08
//
//enum Color {
//    case red(r: Int, g: Int, b: Int)
//    case green(r:Int, g: Int, b: Int)
//    case blue(r: Int, g: Int, b: Int)
//}
//
//func printColors(colors: [Color]) {
//    colors.forEach{
//        switch $0 {
//        case .red(r: let r, g: let g, b: let b):
//            print("이 색상은 빨강이고 RGB 값은 (\(r), \(g), \(b))입니다.")
//        case .green(r: let r, g: let g, b: let b):
//            print("이 색상은 초록이고 RGB 값은 (\(r), \(g), \(b))입니다.")
//        case .blue(r: let r, g: let g, b: let b):
//            print("이 색상은 파랑이고 RGB 값은 (\(r), \(g), \(b))입니다.")
//        }
//    }
//}
//
//
//let colors = [Color.red(r: 255, g: 0, b: 0), Color.green(r: 0, g: 255, b: 0), Color.blue(r: 0, g: 0, b: 255)]
//printColors(colors: colors)

// 출력결과
//이 색상은 빨강이고 RGB 값은 (255, 0, 0)입니다.
//이 색상은 초록이고 RGB 값은 (0, 255, 0)입니다.
//이 색상은 파랑이고 RGB 값은 (0, 0, 255)입니다.













/*
// # 에러 핸들링 (Error Handling)소개 p.133
//
// 발생할 수 있는 모든 에러에 대해 처리
// - 원하는 결과가 나오지 않을 경우에 에러를 발생(스로잉 throwing)
// - 메서드가 던진(throwing) 에러를 잡아서 처리
// do-catch 필요
//
// ```
// do {
//    try [throw를 발생하는 함수()[
// } catch [에러패턴1] {
//
// } catch [에러패턴2] {
//
// } catch [에러패턴3] where [조건] {
//
// } catch [에러패턴4], [에러패턴5] {
//
// } catch {          // 디폴트
//
// }
//
// # defer 구문 p.138
// - 현재 수행되는 코드블록이 종료되기 직전에(맨 마지막) 수행되는 작업을 지정(ex. 정리작업)
//
// */
//
//import Foundation
//
//// 에러 타입 선언하기 p. 134
//
//enum FileTransferError: Error {
//    case noConnection
//    case lowBandwidth
//    case fileNotFound
//}
//
//// 에러 던지기(발생) p.135
//let connectionOK = true
//let connectionSpeed = 30.01
//let fileFound = false
//
//func fileTransfer() throws -> Int {
//    guard connectionOK else {
//        throw FileTransferError.noConnection
//    }
//
//    guard connectionSpeed > 30 else {
//        throw FileTransferError.lowBandwidth
//    }
//
//    guard fileFound else {
//        throw FileTransferError.fileNotFound
//    }
//
//    //다 통과 됐을 때 수행할 코드 여기서부터 적으면 됨
//    return 0
//}
//
//// 스로잉 메서드와 함수 호출 p.136
//func sendFile() -> String {
//    do {
//        try fileTransfer()
//    } catch FileTransferError.noConnection, FileTransferError.lowBandwidth {
//        //        return "No Network Connection"
//    } catch FileTransferError.fileNotFound {
////        return "File not Found"
//    } catch let error {
//        print(error.localizedDescription)
////        return "Unknown error"
//    } catch {
//        // default
//    }
//
//    return "Successful transfer"
//}
//
//print(sendFile())
//
//
//
//
//// 에러 캐칭 비활성화? p.137
//let x = try? fileTransfer()
//let y: Int?
//do {
//    y = try fileTransfer()
//} catch {
//    y = nil
//}
//
//let z = try! fileTransfer()
//
////if let data = try? fileTransfer() { return data }




import Foundation

// 에러 핸들링 예제 01
//
//enum TemperatureError: Error {
//    case invalidTemperature
//}
//
//func celsiusToFahrenheit(_ value: Double) throws -> Double{
//    guard value >= -273.15 else { throw TemperatureError.invalidTemperature }
//
//    return value*9.0/5.0 + 32.0
//}
//
//do {
//    let fahrenheit = try celsiusToFahrenheit(-300)
//    print(fahrenheit)
//} catch TemperatureError.invalidTemperature {
//    print("Invalid temperature")
//}
//// Invalid temperature





// 에러 핸들링 예제 02
//import Foundation
//
//enum PasswordError: Error {
//    case tooShort
//    case missingUppercase
//    case missingLowercase
//    case missingNumber
//    case missingSymbol
//}
//
//func validatePassword(_ password: String) throws {
//    guard password.count >= 8 else { throw PasswordError.tooShort }
//
//    let checkErrors = checkError(password)
//
//    guard checkErrors.u else { throw PasswordError.missingUppercase }
//    guard checkErrors.l else { throw PasswordError.missingLowercase }
//    guard checkErrors.n else { throw PasswordError.missingNumber }
//    guard checkErrors.s else { throw PasswordError.missingSymbol }
//
//    print("Pass")
//}
//
//func checkError(_ str: String) -> (n: Bool, s: Bool, u: Bool, l: Bool) {
//    var check = [false, false, false, false] // [Number, Symbol, Upper, Lower]
//    let symbols = "!@#$%^&*()_+-=[]{}|;:,./<>?"
//
//    for i in str {
//        if let _ = Int(String(i)) {
//            check[0] = true
//        } else if symbols.contains(i) {
//            check[1] = true
//        } else if String(i) == i.uppercased() {
//            check[2] = true
//        } else if String(i) == i.lowercased(){
//            check[3] = true
//        }
//    }
//
//    return (check[0], check[1], check[2], check[3])
//}
//
//do {
//    try validatePassword("abc123")
//} catch let error as PasswordError {
//    switch error {
//    case .tooShort:
//        print("Password is too short")
//    case .missingUppercase:
//        print("Password is missing an uppercase letter")
//    case .missingLowercase:
//        print("Password is missing a lowercase letter")
//    case .missingNumber:
//        print("Password is missing a number")
//    case .missingSymbol:
//        print("Password is missing a symbol")
//    }
//}
// Password is too short
// Password is missing an uppercase letter
// Password is missing a symbol






// 에러 핸들링 예제 03
//
//enum ATMError: Error {
//    case negativeAmount
//    case insufficientBalance
//}
//
//class ATM {
//    var balance: Double = 0
//
//    func deposit(amount: Double) -> Bool {
//        if amount > 0 {
//            balance += amount
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func withdraw(amount: Double) throws -> Double {
//        guard amount > 0 else { throw ATMError.negativeAmount }
//        guard amount <= balance else { throw ATMError.insufficientBalance }
//        balance -= amount
//        return amount
//    }
//}
//
//
//let atm = ATM()
//_ = atm.deposit(amount: 1000)
//print(atm.balance)              // 1000.0
//
//do {
//    let cash = try atm.withdraw(amount: 500)
//    print(cash)                 // 500.0
//} catch let error as ATMError {
//    switch error {
//    case .negativeAmount:
//        print("Cannot withdraw a negative amount")
//    case .insufficientBalance:
//        print("Cannot withdraw more than balance")
//    }
//}
//
//print(atm.balance)              // 500.0




// 에러 핸들링 예제 04
//
//enum CalculatorError: Error {
//    case divisionByZero
//}
//
//struct Calculator {
//    var result: Double = 0
//
//    mutating func add(_ number: Double) { result += number }
//
//    mutating func subtract(_ number: Double) { result -= number }
//
//    mutating func multiply(_ number: Double) { result *= number }
//
//    mutating func divide(_ number: Double) throws {
//        guard number != 0 else { throw CalculatorError.divisionByZero }
//        result /= number
//    }
//
//}
//
//
//var calculator = Calculator()
//calculator.add(10)
//print(calculator.result)        // 10.0
//
//calculator.subtract(3)
//print(calculator.result)        // 7.0
//
//calculator.multiply(2)
//print(calculator.result)        // 14.0
//
//do {
//    try calculator.divide(7)
//    print(calculator.result)    // 2.0
//} catch CalculatorError.divisionByZero {
//    print("Cannot divide by zero")
//}






// 에러 핸들링 예제 05
//
enum LibraryError: Error {
    case bookNotFound
    case limitExceeded
}

class Library {
    var books = [String: Int]()
    var limit: Int
    var borrowBooksCount = 0
    
    init(books: [String] = [], limit: Int = 3) {
        for i in books {
            self.books.updateValue(1, forKey: i)
        }
        self.limit = limit
    }
    
    func borrow(book: String) throws -> String {
        guard books[book] == 1 else { throw LibraryError.bookNotFound }
        guard borrowBooksCount < limit else { throw LibraryError.limitExceeded }
        
        books[book] = 0
        borrowBooksCount += 1
        return "\(book)을 대출했습니다."
    }
}

let library = Library(books: ["Harry Potter", "The Little Prince", "The Hobbit", "찰리와 초콜릿 공장"], limit: 3)
do {
    var result = try library.borrow(book: "The Little Prince")
    print(result)
    result = try library.borrow(book: "Harry Potter")
    print(result)
    result = try library.borrow(book: "The Hobbit")
    print(result)
    result = try library.borrow(book: "찰리와 초콜릿 공장")
    print(result)
} catch LibraryError.bookNotFound {
    print("책을 찾을 수 없습니다.")
} catch LibraryError.limitExceeded {
    print("대출 한도를 초과했습니다.")
}

// limit: 3 일 경우 대출 한도를 초과했습니다.
// limit: 4 일 경우 The Little Prince을 대출했습니다.






// 에러 핸들링 예제 06
//
//enum ParsingError: Error {
//    case invalidJSON
//}
//
//func parseJSON(_ data: String) throws -> Dictionary<String, Any> {
//
//    var tempDictData: Dictionary<String, Any> = [String : Any]()
//
//    do {
//        tempDictData = try JSONSerialization.jsonObject(with: Data(jsonString.utf8), options: []) as! [String:Any]
//
//        let hobbeis = String(describing: tempDictData["hobbies"] ?? "")
//        let h = tempDictData["hobbies"] as? [String]
//
//        let dictData:Dictionary<String,Any> = ["name": tempDictData["name"] ?? "", "age": tempDictData["age"] ?? "", "hobbies": h!]
//
//        return tempDictData
//    } catch {
//        throw ParsingError.invalidJSON
//    }
//}
//
//
//let jsonString = """
//{
//    "name": "John",
//    "age": 25,
//    "hobbies": ["reading", "coding", "gaming"]
//}
//"""
//
//
//do {
//    let dictionary = try parseJSON(jsonString)
//    print(dictionary)
//} catch ParsingError.invalidJSON {
//    print("Invalid JSON format")
//}


//// ["name": "John", "age": 25, "hobbies": ["reading", "coding", "gaming"]]
