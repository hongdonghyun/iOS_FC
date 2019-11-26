//: [Previous](@previous)
/*:
 ---
 # Enumerations
 - 연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능
 ---
 */

//enum CompassPoint {
//  case north
//  case south
//  case east
//  case west
//}
//
//// 열거형 타입의 이름은 Pascal Case
//// 각각의 case는 Camel Case
//
//
//
//
//enum Planet {
//  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
//}
//
//var directionToHead1 = CompassPoint.west
//directionToHead1 = .east
//
//var directionToHead2: CompassPoint = .north
//
//
//
///*:
// ## Matching Enumeration Values
// */
//
//let directionToHead = CompassPoint.south
//
//switch directionToHead {
//case .north:
//  print("Lots of planets have a north")
//case .south:
//  print("Watch out for penguins")
//case .east:
//  print("Where the sun rises")
//case .west:
//  print("Where the skies are blue")
//}
//
//
//let enumTypeAnnotation: Planet = .mars
//let somePlanet = Planet.earth
//
//switch somePlanet {
//case .earth:
//  print("Mostly harmless")
//default:
//  print("Not a safe place for humans")
//}
//
//
///*:
// ---
// ## Associated Values
// ---
// */
//print("\n---------- [ Associated Values ] ----------\n")
//
//
enum OddOrEven {
  case odd(Int)
  case even(Int)
}

var number = OddOrEven.even(20)
number = OddOrEven.odd(13)

number
type(of: number)


switch number {
case .odd(let x): print("홀수 :", x)
case .even(let x): print("짝수 :", x)
}
//
switch number {
case let .odd(x): print("홀수 :", x)
case let .even(x): print("짝수 :", x)
}
//
//
//
//
//enum Barcode {
//  case upc(Int, Int, Int, Int)
//  case qrCode(String)
//}
//
//var productBarcode = Barcode.upc(8, 85909, 51226, 3)
//productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
//
//productBarcode
//type(of: productBarcode)
//
//
//switch productBarcode {
//case let .upc(numberSystem, manufacturer, product, check):
//  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
//case let .qrCode(productCode):
//  print("QR code: \(productCode).")
//}
//
///*:
// ---
// ### Question
// - enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현
// ---
// */
//// 하단 Answer 참고
//
//enum Month {
//    case jan, feb (Bool)
//}
//
//
///*:
// ---
// ## Raw Value
// - Strings, Characters, or any of the Integer or Floating-point number types
// - raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.
// ---
// */
//
//enum Weekday: Int {
//  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
//}
//
//Weekday.wednesday
//Weekday.wednesday.rawValue
//
//
//enum WeekdayName: String {
//  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
//}
//
//WeekdayName.monday
//WeekdayName.monday.rawValue
//
//
//enum Gender: String {
//  case male = "남자", female = "여자", other = "기타"
//}
//
//Gender.male
//Gender.male.rawValue

///*:
// ---
// ### Question
// - 학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 값 부여
// ---
// */
//// 하단 Answer 참고
//
//enum Grade: Double {
//    case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
//}
//
//Grade.A.rawValue
//
//
///*:
// ---
// ### Implicitly Assigned Raw Values
// ---
// */
//
//enum WeekdayAgain: Int {
////  case sunday = 5, monday, tuesday, wednesday, thursday, friday, saturday
//  case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday
////  case sunday = 1, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday
//}
//
//WeekdayAgain.sunday
//WeekdayAgain.sunday.rawValue
//
//WeekdayAgain.wednesday
//WeekdayAgain.wednesday.rawValue
//
//
//
//enum WeekdayNameAgain: String {
//  case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
//}
//
//WeekdayNameAgain.sunday
//WeekdayNameAgain.sunday.rawValue
//
//WeekdayNameAgain.monday
//WeekdayNameAgain.monday.rawValue
//
//
///*:
// ---
// ### Initializing from a Raw Value
// ---
// */
//print("\n---------- [ Initializing from a Raw Value ] ----------\n")
//
//enum PlanetIntRaw: Int {
//  case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
//}
//
//PlanetIntRaw(rawValue: 5)
//PlanetIntRaw(rawValue: 7)
//
////PlanetIntRaw(rawValue: 0)
////PlanetIntRaw(rawValue: 15)
//
//
//
//let positionToFind = 7
////let positionToFind = 11
//
//if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
//  switch somePlanet {
//  case .earth:
//    print("Mostly harmless")
//  default:
//    print("Not a safe place for humans")
//  }
//} else {
//  print("There isn't a planet at position \(positionToFind)")
//}
//
//
//
///*:
// ---
// ## Nested
// ---
// */
//print("\n---------- [ Nested ] ----------\n")
//
//
//enum Device: String {
//  case iPhone, iPad, tv, watch
//
//  func printType() {
//    switch self {
//    case .iPad, .iPhone, .tv:
//      print("device :", self)
//    case .watch:
//      print("apple Watch")
//    }
//  }
//}
//
//let iPhone = Device.iPhone
//iPhone.printType()
//
//
//
//
//enum Wearable {
//  enum Weight: Int {
//    case light = 1
//    case heavy = 2
//  }
//  enum Armor: Int {
//    case light = 2
//    case heavy = 4
//  }
//
//  case helmet(weight: Weight, armor: Armor)
//  case boots
//
//  func info() -> (weight: Int, armor: Int) {
//    switch self {
//    case .helmet(let weight, let armor):
//      return (weight: weight.rawValue * 2, armor: armor.rawValue * 5)
//    case .boots:
//      return (3, 3)
//    }
//  }
//}
//
//
//Wearable.boots
//
//var woodenHelmet = Wearable.helmet(weight: .light, armor: .heavy)
//woodenHelmet.info()



/*:
 ---
 ## Mutating
 - enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 mutating 키워드 필요
 ---
 */
//
//enum Location {
//  case seoul, tokyo, london, newyork
//
////  func travelToLondon() {
////    self = .london
////  }
//
////  mutating func travelToTokyo() {
////    self = .tokyo
////  }
//}
//
//var location = Location.seoul
//location
//
////location.travelToTokyo()
////location
//
//
///*:
// ---
// ### Question
// - on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현
// ---
// */
//// 하단 Answer 참고
//
//enum RemoteControl {
//    case on
//    case off
//
//    mutating func toggle() {
//        switch self {
//            case .on:
//                self = .off
//            case .off:
//                self = .on
//
//        }
//    }
//}
//
//var a = RemoteControl.on
//a.toggle()
//a.toggle()
//
//
//
///*:
// ---
// ## Recursive Enumerations
// - 자기 자신을 참조하는 Enumeration 형식
// ---
// */
//print("\n---------- [ Recursive Enumerations ] ----------\n")
//
//enum ArithmeticExpression {
//  case number(Int)
//  case addition(ArithmeticExpression, ArithmeticExpression)  // 자신의 타입
//  case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//enum ArithmeticExpression {
//  case number(Int)
//  indirect case addition(ArithmeticExpression, ArithmeticExpression)
//  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//indirect enum ArithmeticExpression {
//  case number(Int)
//  case addition(ArithmeticExpression, ArithmeticExpression)
//  case multiplication(ArithmeticExpression, ArithmeticExpression)
//}
//
//
//let five = ArithmeticExpression.number(5)
//let four = ArithmeticExpression.number(4)
//let sum = ArithmeticExpression.addition(five, four)
//print(sum)
//let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
//
//
//
//
//
///*:
// ---
// ### Answer
// ---
// */
//print("\n---------- [ Answer ] ----------\n")

// enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현
//enum Month {
//  case jan, feb(Bool)
//}
//
//let february = Month.feb(false)
//switch february {
//case .jan: break
//case .feb(let isLeafYear): print(isLeafYear)
//}





//// 학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 값 부여
//enum Grade: Double {
//  case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
//}
//
//Grade.A
//Grade.A.rawValue
//
//
//
//
// on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현
//enum RemoteControl {
//  case on, off
//  mutating func toggle() {
//    switch self {
//    case .on:
//      self = .off
//    case .off:
//      self = .on
//    }
//  }
//}
//
//var remoteControl = RemoteControl.on
//remoteControl.toggle()
//remoteControl.toggle()

/*
1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
*/


func combineString(str1: String?, str2: String?, str3: String?) -> String {
//    guard let str1 = str1, let str2 = str2, let str3 = str3 else { return nil }
    return (str1 ?? "") + (str2 ?? "") + (str3 ?? "")
}


combineString(str1: "AB", str2: nil, str3: "EF")

/*
2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
 */


enum Arithmetic {
  case addition, subtraction, multiplication, division
    
    func sum(input1: Int, input2: Int) -> Double {
        var result: Double = 0.0
        switch self {
        case .addition:
            result = Double(input1 + input2)
        case .subtraction:
            result = Double(input1 - input2)
        case .multiplication:
            result = Double(input1 * input2)
        case .division:
            result = Double(input1 / input2)
        }
        return result
    }
}

var a = Arithmetic.addition
a.sum(input1: 1, input2: 2)


/*
1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
각 케이스에는 Double 타입의 Associated Value 를 받도록 함
추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
섭씨 = (화씨 - 32) * 5 / 9
섭씨 = 켈빈 + 273
 celcius 섭씨
 fahrenheit 화씨
 kelvin 절대영도
 
 */

enum Temperature {
    case celcius(Double)
    case fahrenheit(Double)
    case kelvin(Double)
    
    func toCelcius() -> Double {
        switch self {
        case let .celcius(x):
            return x
        case let .fahrenheit(x):
            return (x - 32) * 5 / 9
        case let .kelvin(x):
            return x + Double(273)
        }
        
    }
}

var temp = Temperature.fahrenheit(100.5)
print(temp.toCelcius())


/*2. 다음 ArithmeticExpression 의 각 케이스별로 연산을 수행하고 그 값을 반환하는 evaluate 함수 구현
enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

*/

indirect enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
        case .number(let number):
            return number
        case .addition(let input1, let input2):
            return evaluate(input1) + evaluate(input2)
        case .multiplication(let input1, let input2):
            return evaluate(input1) * evaluate(input2)
    }
}

evaluate(product)





//: [Next](@next)
