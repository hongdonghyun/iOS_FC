//: [Previous](@previous)
/*:
 # closure
 - 코드에서 사용하거나 전달할 수 있는 독립적인 기능을 가진 블럭
 - 함수도 클로저의 일종
 */
/*
 미지원 : Fortran, Pascal, Java 8버전 미만, C++11 버전 미만 등
 지원 : Swift, Objective-C, Python, Java 8 이상, C++11 이상, Javascript 등

 언어마다 조금씩 특성이 다름
 다른 프로그래밍 언어의 Lambda(람다 - 익명 함수), Block과 유사
 Lambda ⊃ Closure
 */


/*
 전역(Global) 함수와 중첩(Nested) 함수는 사실 클로저의 특수한 예에 해당.
 클로저는 다음 3가지 중 한 가지 유형을 가짐

 - Global functions: 이름을 가지며, 어떤 값도 캡쳐하지 않는 클로저
 - Nested functions: 이름을 가지며, 감싸고 있는 함수의 값을 캡쳐하는 클로저
 - Closure: 주변 문맥(Context)의 값을 캡쳐할 수 있으며, 간단한 문법으로 쓰여진 이름 없는 클로저
 */

//: ## Global functions
print("\n---------- [ Global ] ----------\n")

print(1)
max(1, 2)
func globalFunction() { }


//: ## Nested functions
print("\n---------- [ Nested ] ----------\n")

// 캡쳐는 나중에 다시 다룰 내용이므로 가볍게 받아들일 것

func outsideFunction() -> () -> () {
  var x = 0
  func nestedFunction() {
    x += 1    // 그 자신의 함수가 가지지 않은 값을 사용
    print(x)
  }
  return nestedFunction
}
let nestedFunction = outsideFunction()
nestedFunction()
nestedFunction()
nestedFunction()


//: ## Closure
/*
 Closure Expression Syntax

 { <#(parameters)#> -> <#return type#> in
   <#statements#>
 }
 */

print("\n---------- [ Basic ] ----------\n")

func aFunction() {
  print("This is a function.")
}
aFunction()

({
  print("This is a closure.")
})()



print("\n---------- [ Save closure to variable ] ----------\n")

// 클로저를 변수에 담아 이름 부여 가능
let closure = {
  print("This is a closure.")
}
closure()


// 함수도 변수로 저장 가능
var function = aFunction
function()


// 같은 타입일 경우 함수나 클로저 관계없이 치환 가능
function = closure
function()



print("\n---------- [ Closure Syntax ] ----------\n")

// 파라미터 + 반환 타입을 가진 함수
func funcWithParamAndReturnType(_ param: String) -> String {
  return param + "!"
}
print(funcWithParamAndReturnType("function"))



// 파라미터 + 반환 타입을 가진 클로저
// Type Annotation
let closureWithParamAndReturnType1: (String) -> String = { param in
  return param + "!"
}
print(closureWithParamAndReturnType1("closure"))

let stringCountClosure: (String) -> Int = { str in
    str.count
}

stringCountClosure("qwe")

let <#varialbe#>: (<#inputType#>) -> <#returnType#> = { <#parameter#> in
    <#code#>
}

// Argument Label은 생략. 함수의 Argument Label을 (_)로 생략한 것과 동일


// 파라미터 + 반환 타입을 가진 클로저
let closureWithParamAndReturnType2 = { (param: String) -> String in
  return param + "!"
}
print(closureWithParamAndReturnType2("closure"))


// 파라미터 + 반환 타입을 가진 클로저
// Type Inference
let closureWithParamAndReturnType3 = { param in
  param + "!"
}
print(closureWithParamAndReturnType3("closure"))

let c2: (String) -> Int = {$0.count}
print(c2("swift123"))



/*:
 ---
 ### Question
 - 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현
 - 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
 ---
 */
// 1번 문제 예.   "Swift" -> 5
// 2번 문제 예.   5 -> 6

let hong3Closure = { (param: String) -> Int in
    return param.count
}
print(hong3Closure("swift"))

let hong3Closure2: (Int) -> Int = { param in
    return param + 1
}
print(hong3Closure2(5))


/*:
 ---
 ### Closure를 쓰는 이유?
 ---
 */
/*
 - 문법 간소화 / 읽기 좋은 코드
 - 지연 생성
 - 주변 컨텍스트의 값을 캡쳐하여 작업 수행 가능
*/


/*:
 ## Syntax Optimization
 */
/*
 Swift 클로저 문법 최적화
 - 문맥을 통해 매개변수 및 반환 값에 대한 타입 추론
 - 단일 표현식 클로저에서의 반환 키워드 생략
 - 축약 인수명
 - 후행 클로저 문법
 */

print("\n---------- [ Syntax Optimization ] ----------\n")

// 입력된 문자열의 개수를 반환하는 클로저를 함수의 파라미터로 전달하는 예
func performClosure(param: (String) -> Int) {
  param("Swift")
}

performClosure(param: { (str: String) -> Int in
  return str.count
})

performClosure(param: { (str: String) in
  return str.count
})

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
})

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count }

func fibonacci(_ num: Int) -> Int {
    var resultArray = [0,1]
    var one = resultArray[0]
    var two = resultArray[1]
    var result: Int
    while resultArray.count < num {
        result = one + two
        one = two
        two = result
        resultArray.append(result)
    }
    return resultArray[num-1]
}
/*:
 ## Inline closure
 - 함수의 인수(Argument)로 들어가는 클로저
 */
print("\n---------- [ Inline ] ----------\n")


func closureParamFunction(closure: () -> Void) {
  closure()
}
func printFunction() {
  print("Swift Function!")
}
let printClosure = {
  print("Swift Closure!")
}

closureParamFunction(closure: printFunction)
closureParamFunction(closure: printClosure)

// 인라인 클로저 - 변수나 함수처럼 중간 매개체 없이 사용되는 클로저
closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})


/*:
 ## Trailing Closure
 - 함수의 괄호가 닫힌 후에도 인수로 취급되는 클로저
 - 함수의 마지막 인수(Argument)에만 사용 가능하고 해당 인수명은 생략
 - 하나의 라인에 다 표현하지 못할 긴 클로져에 유용
 */
print("\n---------- [ Trailing ] ----------\n")

// 후위 또는 후행 클로저
// closureParamFunction { <#code#> }

closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})
closureParamFunction() {
  print("Trailing closure - Implicit closure parameter name")
}
closureParamFunction {
  print("Trailing closure - Implicit closure parameter name")
}



func multiClosureParams(closure1: () -> Void, closure2: () -> Void) {
  closure1()
  closure2()
}

multiClosureParams(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

multiClosureParams(closure1: {
  print("inline")
}) {
  print("trailing")
}



/*:
 ---
 ### Question
 - 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
 - 정수를 두 개 입력 받아 곱한 결과를 반환하는 클로져
 ---
 */


let evenCheck = { $0 % 2 == 0 }
print(evenCheck(4))

let intMul: (Int, Int) -> Int = { $0 * $1 }
print(intMul(4,5))

/*
[ 도전 과제 ]
1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
*/

let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}

let someClosureOptimize: (String, String) -> Bool = { $0 > $1 }


print(someClosureOptimize("str","st"))

let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  for _ in values {
    count += 1
  }
  return count
}

let otherClosureOptimize: ([Int]) -> Int = { $0.count }

print(otherClosureOptimize([1,2,3]))

/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

/// 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현

// 1단계 - 함수로 생각
func stringCount(str: String) -> Int {
  return str.count
}
print(stringCount(str: "Swift"))

// 2단계 - 클로저로 변형
let stringCount = { (str: String) -> Int in
  return str.count
}
stringCount("Swift")

// 3단계 - 문법 최적화
let stringCount2: (String) -> Int = { $0.count }



/// 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
let addOne = { (num: Int) -> Int in
  return num + 1
}
addOne(5)


/// 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
let isEven = { (number: Int) -> Bool in
  return number % 2 == 0
}
// Optimization
let isEven2 = { $0 % 2 == 0 }
isEven(6)
isEven(5)


/// 정수를 두 개 입력받아 곱한 결과를 반환하는 클로져
let multiplyTwoNumbers = { (op1: Int, op2: Int) -> Int in
  return op1 * op2
}
// Optimization
let multiplyTwoNumbers2: (Int, Int) -> Int = { $0 * $1 }

multiplyTwoNumbers(20, 5)
multiplyTwoNumbers(5, 10)
multiplyTwoNumbers2(5, 10)

//: [Next](@next)

/*
1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
*/

func rangeSum(_ input: Int) -> Int {
    if input == 0 { return 1 }
    let sign = input < 0 ? true : false
    let sum = abs(input) * (abs(input) + 1) / 2
    return sign ? -sum + 1 : sum
}


/*
 2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
 e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
 */


func print369(_ input: Int) {
    let sequence = Array(stride(from: 1, to: input + 1, by: 1)).map { String($0) }
    for i in sequence {
        if i.contains("3") || i.contains("6") || i.contains("9") {
            print("*", terminator: " ")
        } else {
            print(i, terminator: " ")
        }
        
    }
    
}

/*
 3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
 e.g.  Input : 6, 9   ->  Output : 18, 3
 */


// 최대공약수
func GCD(_ min: Int, _ max: Int) -> Int {
    let remain = min % max
    if remain == 0 {
        return max
    }
    else {
        return GCD(max, remain)
    }
}

// 최소공배수
func LCM(_ a: Int, _ b:Int) -> Int {
    return a * b / GCD(a,b)
}

LCM(6,9)
GCD(6,9)
