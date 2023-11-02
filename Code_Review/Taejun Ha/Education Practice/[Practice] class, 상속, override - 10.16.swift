///*
// class [클래스 이름]: [부모 클래스|프로토콜\ {
//    //프로퍼티
//    //인스턴스 메서드
//    //타입 메서드
// }
// */
//
//class BankAccount {
//    // 프로퍼티 (변수)
//    var accountBalance: Float = 0
//    var accountNumber: Int = 0
//    let fees: Float = 25.00
//
//    // 저장 프로퍼티와 연산(계산) 프로퍼티
//    // 연산 프로퍼티는 프로퍼티에 값을 설정하거나 가져오는 시점에서 어떤 계산이나 로직에 따라 처리된 값
//    // 게터 getter, 세터 setter 메서드를 생성함 p.92
//    var balanceLessFees: Float {
//        get {
//            return accountBalance - fees
//        }
//        set(newBalance) {
//            accountBalance = newBalance - fees
//        }
//    }
//
//    // 클래스 인스턴스 초기화
//    init(number: Int, balance: Float) {
//        accountNumber = number
//        accountBalance = balance
//    }
//
//    // 소멸자 : 클래스 인스턴스가 없어질 때 없어지기 전에 해야할 코드를 넣는다
//    // p. 90
//    deinit {
//
//    }
//
//    // 인스턴스 메서드 (인스턴스 메서드는 객체가 생성되지 않으면 accountBalance와 accountNumber가 메모리에 생성되지 않으므로 사용할 수 없음)
//    func displayBalance() {
//        print("Number \(accountNumber)")
//        print("Current balance is \(accountBalance)")
//    }
//
//
//    // 타입 메서드 (객체를 생성하지 않아도 클래스이름.메서드명()으로 사용가능한 메서드)
//    // 즉, 타입 자체에서 호출되는 메서드
//    class func getMaxBalance() -> Float {
//        return 100000.0
//    }
//}
//
//let account1 = BankAccount(number: 1, balance: 100.0)
//account1.displayBalance()
//print("balanceLessFees :",account1.balanceLessFees)
//
//let account2 = BankAccount(number: 2, balance: 500.0)
//account2.displayBalance()
//
//print(BankAccount.getMaxBalance())
//
//
//
//class SavingsAccount: BankAccount {
//    var interesRate: Float = 0.0
//
//    func calculateInterest() -> Float {
//        return interesRate * accountBalance
//    }
//}
//
//let savings1 = SavingsAccount(number: 1, balance: 100.0)
//print(savings1.calculateInterest())





/*
 Protocol
 
 */

//protocol MessageBuilder {
//    var name: String { get }
//    func buildMessage() -> String
//}
//
//class MyClass: MessageBuilder {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func buildMessage() -> String {
//        "Hello " + name
//    }
//}
//
//var class1 = MyClass(name: "HATAEJUN")
//class1.name = "KKK"
//
//print(class1.buildMessage())





/*
 불투명 반환 타입
 */

//
//func doubleFunc1(value: Int) -> some Equatable {
//    value * 2
//}
//
//func doubleFunc2(value: String) -> some Equatable {
//    value + value
//}
//
//let intOne = doubleFunc1(value: 10)
//let intTwo = doubleFunc1(value: 20)
//let stringOne = doubleFunc2(value: "Hello")
//
//if (intOne == intTwo){
//    print("They match")
//} else {
//    print(intOne)
//    print(intTwo)
//}











/*
 상속
 */

//class SavingAccount: BankAccount {
//    var interestRate: Float = 0.0
//
//    func calculateInterest() -> Float {
//        return interestRate * accountBalance
//    }
//
//    //상속받은 메서드 오버라이딩 p.103
//    // 메서드 재정의
//    override func displayBalance() {
//        super.displayBalance()
//        print("Number \(accountNumber)")
//        print("Current balance is \(accountBalance)")
//        print("Prevailing interest rate is \(interestRate)")
//    }
//}
//
//
//let savings1 = SavingAccount(number: 1, balance: 100.0)
//savings1.displayBalance()









// 상속 예제 05
//
//class Animal {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func makeSound() {
//        print()
//    }
//}
//
//class Cat: Animal {
//    override func makeSound() {
//        print("\(name) : 야옹")
//    }
//}
//
//class Dog: Animal {
//    override func makeSound() {
//        print("\(name) : 멍멍")
//    }
//}
//
//let cat: Animal = Cat(name: "나비")
//let dog: Animal = Dog(name: "바둑")
//cat.makeSound()
//dog.makeSound()




// 상속 예제 06
//
//class Person {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func introduce() {
//        print("저는 \(name)이고, \(age)입니다.", terminator: " ")
//    }
//}
//
//
//class Student: Person {
//    var grade: Int
//    var classNumber: Int
//
//    init(name: String, age: Int, grade: Int, classNumber: Int) {
//        self.grade = grade
//        self.classNumber = classNumber
//        super.init(name: name, age: age)
//    }
//
//    override func introduce() {
//        super.introduce()
//        print("저는 \(grade)학년 \(classNumber)반입니다.")
//    }
//}
//
//class Teacher: Person {
//    var subject: String
//
//    init(name: String, age: Int, subject: String) {
//        self.subject = subject
//        super.init(name: name, age: age)
//    }
//
//    override func introduce() {
//        super.introduce()
//        print("저는 \(subject) 선생님입니다.")
//    }
//}
//
//let student: Person = Student(name: "민수", age: 15, grade: 2, classNumber: 3)
//let teacher: Person = Teacher(name: "영희", age: 25, subject: "수학")
//student.introduce() // 저는 민수이고, 15살입니다. 저는 2학년 3반입니다.
//teacher.introduce() // 저는 영희이고, 25살입니다. 저는 수학 선생님입니다.






// 상속 예제 07
//
//class Figure {
//    var color: String
//
//    init(color: String) {
//        self.color = color
//    }
//
//    func area() -> Double {0.0}
//}
//
//class Triangle: Figure {
//    var base: Double
//    var height: Double
//
//    init(color: String, base: Double, height: Double) {
//        self.base = base
//        self.height = height
//        super.init(color: color)
//    }
//
//    override func area() -> Double {
//        base * height / 2.0
//    }
//
//}
//
//class Rectangle: Figure {
//    var width: Double
//    var length: Double
//
//    init(color: String, width: Double, length: Double) {
//        self.width = width
//        self.length = length
//        super.init(color: color)
//    }
//
//    override func area() -> Double {
//        width * length
//    }
//}
//
//let triangle = Triangle(color: "red", base: 3, height: 4)
//let rectangle = Rectangle(color: "blue", width: 5, length: 6)
//print(triangle.area()) // 6.0
//print(rectangle.area()) // 30.0


