//import Foundation
//
///*
// 다음의 클로져를 FullSyntax 로부터 Optimized Syntax 로 차근차근 줄여보세요.
// 그리고 그 과정에 일어나는 변화를 주석으로 설명하세요.
//
// func performClosure(param: (String) -> Int) {
//   param("Swift")
// }
// */
////func performClosure(param: (String) -> Int) {
////    param("Swift")
////}
//
//
///*
// 자연수 하나를 입력받아 1년부터 그 해까지의 모든 윤년의 개수를 출력하는 함수
// (공식 : 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
// 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
// 윤년X 예시 - 200, 300, 500, 600, 1900, 2100
//
// Intput : 2019
// Output : 윤년에 속하는 해는 총 489회입니다.
// */
//
//// 다시
//func year(_ input: Int) {
//    var yearCount = 0
//    for i in 1...input {
//        if i % 400 == 0 || i % 4 == 0 && i % 100 != 0 {
//            yearCount += 1
//        }
//    }
//    print("윤년에 속하는 해는 총 \(yearCount)회 입니다.")
//}
//
//year(2019)

//
///*
// 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
// e.g.
// > Input : ["a", "b", "c", "a", "e", "d", "c"]
// > Output : ["b", "e" ,"d"]
// */
//
//func duplicateCheck(_ charArray: [Character]) -> [Character] {
//    let setArray = Set(charArray)
//    var duplicate: [Character]  = []
//    for i in 0...charArray.count-1 {
//        for j in i+1..<charArray.count {
//            if charArray[i] == charArray[j] {
//                duplicate.append(charArray[i])
//            }
//        }
//
//    }
//
//    return Array(setArray.subtracting(duplicate))
//}
//
//duplicateCheck(["a", "b", "c", "a", "e", "d", "c"])
//
//
//
//
//
//
///*
// 자연수를 입력받아 그 숫자보다 작거나 같은 모든 소수와 그 개수를 출력하는 함수를 정의
//
// e.g.
// func checkPrimeNumbers(number: Int)
// > Input : 10
// > Output : 10보다 작거나 같은 소수는 [2, 3, 5, 7]이고, 총 4개입니다.
// */
//
//

func isPrime(_ i: Int) -> Bool {
    
    for j in 2..<i {
        if i % j == 0 {
            return false
        }
    }
    
    return true
}

//func isPrime(number: Int) -> Bool {
//    for i in 2..<number {
//        if number % i == 0 {
//            return false
//    }
//    return true
//}

func checkPrimeNumbers(number: Int) {
    var primeArray: [Int] = []
    for i in 2..<number {
        if isPrime(i) {
            primeArray.append(i)
        }
    }
    
    print("\(number)보다 작거나 같은 소수는\(primeArray)이고 총 \(primeArray.count)개입니다.")
}
 
let someTuple = (1,90)
switch someTuple {
    case let (x, y) where y == 90:
        print("x: \(x), y: \(y)")
        fallthrough
    case (1 ,let x):
        print("x: \(x)")
    default:
        print("default")
}
//checkPrimeNumbers(number: 1)
//checkPrimeNumbers(number: 2)
//checkPrimeNumbers(number: 100)
//
//
//
//
///**
// 구글(google), 카카오(kakao), 네이버(naver) 로그인을 위해 Site라는 이름의 Enum 타입을 만들고자 합니다.
// 각 case는 사용자의 아이디(String)와 비밀번호(String)를 위한 연관 값(associated value)을  가집니다.
// 그리고 Site 타입 내부에는 signIn()이라는 이름의 메서드를 만들어 다음과 같이 문자열을 출력하는 기능을 구현해보세요.
//
// e.g.
// enum Site {}
// > Input
// let google = Site.google("google@gmail.com", "0000")
// google.signIn()
//
// > Output
// 구글에 로그인하였습니다. (아이디 - google@gmail.com, 비밀번호 - 0000)
// */
//
enum Site {
    case Google(_ ID: String, _ PWD: String)
//    case Kakao(_ ID: String, _ PWD: String)
//    case naver(_ ID: String, _ PWD: String)
//    case Google
    case kakao
    case naver
}

//print(Site.Google("hong3","12345678"))
//func oddEven(_ input: Int) -> Bool {
//    input % 2 == 0 ? true : false
//}

var someVariable: Int?
//someVariable ?? 0
//someVariable!
class Person {
    var checkCard: CheckCard?
}

class CheckCard {
    var balance: Money?
    var sign: Bool = true
}

class Money {
    var won = 123
}

class Hong3 {
    var _balance: Int = 0
    var balance: Int {
        get {
            return _balance
        }
        set {
            _balance = newValue
        }
    }
}
var balance: Int = 0 {
    didSet {
        print("balance를 \(oldValue)로 설정합니다.")
    }
    willSet {
        print("balance를 \(newValue)로 설정했습니다.")
    }
}
//
//let hong3 = Person()
//print(hong3.checkCard?.balance?.won)
//let S20 = CheckCard()
//hong3.checkCard = S20
//print(hong3.checkCard?.sign)

//    func signIn() {
//        switch self {
//        case .google(let i, let p):
//            print("구글에 로그인하였습니다.(아이디 - \(i), 비밀번호 -\(p)")
//        case .kakao(let i, let p):
//            print("카카오에 로그인하였습니다.(아이디 - \(i), 비밀번호 -\(p)")
//        case .naver(let i, let p):
//            print("네이버에 로그인하였습니다.(아이디 - \(i), 비밀번호 -\(p)")
//        default:
//            print("Error!")
//        }
//    }
//}

//
//let google = Site.google("hong4367@gmail.com","12345")
//let kakao = Site.kakao("hong4367@gmail.com","12345")
//let naver = Site.naver("hong4367@gmail.com","12345")
//
//google.signIn()
//kakao.signIn()
//naver.signIn()
//
//
//
//
//


import Foundation

func solution(_ arrangement:String) -> Int {
    let innerArray = Array(arrangement)
    var cnt = 0
    var result = 0
    for (index,value) in innerArray.enumerated() {
        if value == "(" {
            cnt += 1
        } else {
            cnt -= 1
            if innerArray[index-1] == "(" {
                result += cnt
            } else {
                result += 1
            }
        }
        
    }
    return result
}

solution("(((()())(())()))(())")


/*
 수고하셨습니다!
 */

