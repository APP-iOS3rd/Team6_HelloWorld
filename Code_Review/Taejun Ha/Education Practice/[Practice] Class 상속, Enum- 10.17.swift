
/*
 11번 : X
 12번 : X
 13번 : O
 */

//// 14번
//
//class Vehicle {
//    var model: String
//    var color: String
//
//    init(model: String, color: String) {
//        self.model = model
//        self.color = color
//    }
//
//    func drive() {
//        print("\(model) \(color) ",terminator: "")
//    }
//}
//
//class Car: Vehicle {
//    var doorNumber: Int = 0
//
//    init(model: String, color: String, doorNumber: Int) {
//        self.doorNumber = doorNumber
//        super.init(model: model, color: color)
//    }
//
//    override func drive() {
//        super.drive()
//        print("자동차가 \(doorNumber)개의 문을 열고 달립니다.")
//    }
//}
//
//class Motorcycle: Vehicle {
//    var helmet: Bool
//
//    init(model: String, color: String, helmet: Bool) {
//        self.helmet = helmet
//        super.init(model: model, color: color)
//    }
//
//    override func drive() {
//        super.drive()
//        print("오토바이가 헬멧을" + (helmet ? "쓰고 달립니다." : "쓰지 않고 달립니다."))
//    }
//}
//
//let car: Vehicle = Car(model: "소나타", color: "검정", doorNumber: 4)
//let motorcycle: Vehicle = Motorcycle(model: "니노", color: "노랑", helmet: true)
//car.drive() // 소나타 검정 자동차가 4개의 문을 열고 달립니다.
//motorcycle.drive() // 니노 노랑 오토바이가 헬멧을 쓰고 달립니다. or // ~오토바이가 헬멧을 쓰지 않고 달립니다





// 상속 예제 15
//
//
//class Food {
//    var name: String
//    var price: Int
//
//    init(name: String, price: Int) {
//        self.name = name
//        self.price = price
//    }
//
//    func order() {
//    }
//}
//
//class Pizza: Food {
//    var topping: String
//
//    init(name: String, price: Int, topping: String) {
//        self.topping = topping
//        super.init(name: name, price: price)
//    }
//
//    override func order() {
//        print("\(name) 피자에 \(topping)피자를 주문하였습니다. 가격은 \(price)원입니다.")
//    }
//}
//
//class Pasta: Food {
//    var sauce: String
//
//    init(name: String, price: Int, sauce: String) {
//        self.sauce = sauce
//        super.init(name: name, price: price)
//    }
//
//    override func order() {
//        super.order()
//        print("\(name) 파스타에 \(sauce) 소스를 선택하였습니다. 가격은 \(price)원입니다.")
//    }
//}
//
//let cheesePizza: Food = Pizza(name: "치즈", price: 15000, topping: "치즈")
//let carbonara: Food = Pasta(name: "카르보나라", price: 12000, sauce: "크림")
//cheesePizza.order() // 치즈 피자에 치즈피자를 주문하였습니다. 가격은 15000원입니다.
//carbonara.order()   // 카르보나라 파스타에 크림 소스를 선택하였습니다. 가격은 12000원입니다.
//










// 상속 예제 16
//
//class Animal {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func cry() {
//
//    }
//}
//
//class Dog: Animal {
//    var bark: String
//
//    init(name: String, age: Int, bark: String) {
//        self.bark = bark
//        super.init(name: name, age: age)
//    }
//
//    override func cry() {
//        print("\(name)이(가) \(bark)라고 짖어요.")
//    }
//}
//
//class Cat: Animal {
//    var meow: String
//
//    init(name: String, age: Int, meow: String) {
//        self.meow = meow
//        super.init(name: name, age: age)
//    }
//
//    override func cry() {
//        print("\(name)이(가) \(meow)라고 울어요.")
//    }
//}
//
//class Duck: Animal {
//    var bark: String
//
//    init(name: String, age: Int, bark: String) {
//        self.bark = bark
//        super.init(name: name, age: age)
//    }
//
//    override func cry() {
//        print("\(name)이(가) \(bark)라고 짖어요.")
//    }
//}
//
//let kitty = Cat(name: "나비", age: 3, meow: "야옹")
//let puppy = Dog(name: "초코", age: 2, bark: "멍멍")
//let duck = Duck(name: "멋쟁", age: 2, bark: "꽥꽥")
//
//let animals: [Animal] = [kitty, puppy, duck]
//animals[0].cry()    // 나비이(가) 야옹라고 울어요.
//animals[1].cry()    // 초코이(가) 멍멍라고 짖어요.
//animals[2].cry()    // 멋쟁이(가) 꽥꽥라고 짖어요.
//for ani in animals { ani.cry() }
//


/*
 # 클래스 익스텐션 class extension p.105
 
 클래스에 기능을 추가하는 방법중 하나
 
 ```
 extension 클래스 이름 {
    // 새로운 기능을 여기에 추가
 }
 ```
 
 */
//
//extension Double {
//    var squared: Double {
//        return self * self
//    }
//
//    var cubed: Double {
//        return self * self * self
//    }
//}
//
//var x = Double()
//
//let myValue: Double = 3.0
//
//print(myValue.squared)
//
//print(6.0.cubed)






/*
 # 열거형 (Enumerations) 소개 p.111
 
 미리 정의된 값 집합으로 구성된 사용자 지정 데이터 유형
 
 (연관된 항목들을 묶어서 표현할 수 있는 타입)
 
 열거형은 일반적으로 switch 문을 사용할 때와 같이
 코드 내에서 결정을 내릴 때 사용
 
 ```
 enum 열거형이름 {
 case ..
 case ..
 case ..
 ...
 ...
 }
 */

// 열거형 내의 개별 케이스에 연결된 값을 사용
//enum Temperature {
//    case hot
//    case warm
//    case cold(centigrade: Int)
//}
//
//func displayTempInfo(temp: Temperature) {
//    switch temp {
//    case .hot:
//        print("It is hot.")
//    case .warm:
//        print("It is warm.")
//    case .cold(centigrade: let centigrade) where centigrade <= 0:
//        print("Ice warning: \(centigrade) degrees.")
//    case .cold:
//        print("It is cold.")
//    }
//}

// rawValue 값 지정과 사용
//displayTempInfo(temp: .warm)
//displayTempInfo(temp: .cold(centigrade: -10))
//displayTempInfo(temp: .hot)
//
//enum AnimalEnum: Int {
//    case Dog = 1
//    case Cat = 2
//    case Duck
//}
//
//print(AnimalEnum.Dog.rawValue)
//print(AnimalEnum.Cat.rawValue)






// 열거형 예제 01
//
//enum Suit {
//    case spade, heart, diamond, club
//}
//
//enum Rank {
//    case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
//}
//
//struct Card {
//    var suit: Suit
//    var rank: Rank
//}
//
//func compareCards(card1: Card, card2: Card) {
//    if card1.suit == card2.suit && card1.rank == card2.rank {
//        print("두 카드는 모두 같습니다.")
//    } else if card1.suit == card2.suit {
//        print("두 카드는 같은 무늬입니다.")
//    } else if card1.rank == card2.rank {
//        print("두 카드는 같은 숫자입니다.")
//    } else {
//        print("두 카드는 모두 다릅니다.")
//    }
//}
//
//let card1 = Card(suit: .spade, rank: .ace)
//let card2 = Card(suit: .heart, rank: .king)
//
//// 카드 두 장을 비교합니다.
//compareCards(card1: card1, card2: card2)  // 두 카드는 모두 다릅니다.




// 열거형 예제 02
//
//enum Animal {
//    case dog(name: String)
//    case cat(name: String)
//    case bird(name: String)
//}
//
//func checkAnimal(animals: [Animal]) {
//    animals.forEach{
//        switch $0 {
//        case .dog(name: let name):
//            printAnimal(species: "개", name: name)
//        case .cat(name: let name):
//            printAnimal(species: "고양이", name: name)
//        case .bird(name: let name):
//            printAnimal(species: "새", name: name)
//        }
//    }
//}
//
//func printAnimal(species: String, name: String) {
//    print("이 동물은 \(species)이고 이름은 \(name)입니다.")
//}
//
//let animals = [Animal.dog(name: "바둑이"), Animal.cat(name: "나비"), Animal.bird(name: "짹짹이")]
//checkAnimal(animals: animals)



// 열거형 예제 03
//
//enum Season {
//    case Spring
//    case Summer
//    case Autumn
//    case Winter
//    case Error
//}
//
//func getSeason(date: (month: Int, day: Int)) -> Season {
//    switch date {
//    case (2...4, 0...31):
//        return .Spring
//    case (5...8, 0...31):
//        return .Summer
//    case (9...10, 0...31):
//        return .Autumn
//    case (11...12, 0...31):
//        return .Winter
//    case (1, 0...31):
//        return .Winter
//    default:
//        return .Error
//    }
//}
//
//let today = (month: 10, day: 17)
//let season = getSeason(date: today)
//
//print("오늘은 \(season)입니다.")  // 오늘은 autumn입니다.
//print("오늘은 \( getSeason(date: (month: 6, day: 17)) )입니다.")      // 오늘은 summer입니다.
//print("오늘은 \( getSeason(date: (month: 12, day: 15)) )입니다.")     // 오늘은 winter입니다.
//print("오늘은 \( getSeason(date: (month: 3, day: 1)) )입니다.")       // 오늘은 spring입니다.






// 열거형 예제 04
//
//enum Operator {
//    case divide
//    case multiply
//    case add
//    case subtract
//}
//
//func calculate(num1: Int, num2: Int, op: Operator) -> Int {
//    switch op {
//    case .divide: return num1 / num2
//    case .multiply: return num1 * num2
//    case .add: return num1 + num2
//    case .subtract: return num1 - num2
//    }
//}
//
//let result = calculate(num1: 10, num2: 5, op: .divide)
//
//print("결과는 \(result)입니다.")      //결과는 2입니다.
//print("결과는 \( calculate(num1: 10, num2: 5, op: .add) )입니다.")        //결과는 15입니다.
//print("결과는 \( calculate(num1: 10, num2: 5, op: .subtract) )입니다.")   //결과는 5입니다.
//print("결과는 \( calculate(num1: 10, num2: 5, op: .multiply) )입니다.")   //결과는 50입니다.






// 열거형 예제 05
//
//enum Beverage {
//    case coffee(price: Int)
//    case tea(price: Int)
//    case juice(price: Int)
//}
//
//func printTypeAndPrice(beverages: [Beverage]) {
//    beverages.forEach{
//        switch $0 {
//        case .coffee(price: let price): printPrice(beverage: "커피", price: price)
//        case .juice(price: let price): printPrice(beverage: "주스", price: price)
//        case .tea(price: let price): printPrice(beverage: "차", price: price)
//        }
//    }
//}
//
//func printPrice(beverage: String, price: Int) {
//    print("이 음료는 \(beverage)이고 가격은 \(price)원입니다.")
//}
//
//
//let beverages = [Beverage.coffee(price: 3000), Beverage.tea(price: 2000), Beverage.juice(price: 2500)]
//printTypeAndPrice(beverages: beverages)
