//: [Previous](@previous)
/*:
 # Basic Operators
 */
//: [연산자 우선 순위 참고](https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations)
/*:
 ---
 ## Terminology
 ---
 */
let a = 123
let b = 456
let c: Int? = 789

// Unary Operator (단항 연산자)
-a

// Prefix (전위 표기법)
-a

// Postfix (후위 표기법)
c!


// Binary Operator (이항 연산자)
a + b

// Infix (중위 표기법)
a + b


// Ternary Operator (삼항 연산자)
// Swift 에서 삼항 연산자는 단 하나
a > 0 ? "positive" : "zero or negative"

//if a > 0 {
//  "positive"
//} else {
//  "negative"
//}


/*:
 ---
 ## Assignment Operators
 ---
 */

// Basic assignment operator
var value = 0

// Addition assignment operator
value = value + 10

// Subraction assignment operator
value = value - 5

// Multiplication assignment operator
value = value * 2

// Division assignment operator
value = value / 2

// Modulo assignment operator
value = value % 2

// Compound assignment Operators
value += 10
value -= 5
value *= 2
value /= 2
value %= 2

// 미지원 : value++ , value--

//value++
//value += 1
//value = value + 1

var (x, y) = (1, 2)
print(x, y)


/*:
 ---
 ## Arithmetic Operators
 ---
 */
// Unary plus opertor
+a

// Addition Operator
a + b

"Hello, " + "world"

// Unary minus Operator
-a

// Subtraction Operator
a - b

// Multiplication Operator
a * b

// Division Operator
b / a

// Modulo operator
b % a


// 실수에서의 나눗셈
let e = 123.4
let f = 5.678

e / f
//e % f

// 나머지 구하기 1 (반올림)
e.remainder(dividingBy: f)

// 나머지 구하기 2 (내림)
e.truncatingRemainder(dividingBy: f)


// 나머지 구하기 2 의 계산 방법
let quotient = (e / f).rounded(.towardZero)
let remainder = e.truncatingRemainder(dividingBy: f)
let sum = f * quotient + remainder


/*:
 ---
 ## Precedence
 ---
 */

1 + 2 * 3
1 + (2 * 3)
(1 + 2) * 3

1 + 2 * 3 + 3
1 + (2 * 3) + 3
1 + 2 * (3 + 3)

1 * 2 - 3
(1 * 2) - 3
1 * (2 - 3)

/*:
 ---
 ## Comparison Operators
 ---
 */
// Equal to operator
a == b

// Not equal to operator
a != b

// Greater than operator
a > b

// Greater than or equal to operator
a >= b

// Less than operator
a < b

// Less than or equal to operator
a <= b


/*:
 ## Question
 - 숫자가 아닌 문자열에 대한 비교는?
 */

"iOS" > "Apple"
"Application" > "Steve Jobs"
"Swift5" <= "Swift4"
"Playground" == "Playground"


/*:
 ---
 ## Logical Operators
 ---
 */

// Logical AND Operator
true && true
true && false
false && true
false && false

// Logical OR Operator
true || true
true || false
false || true
false || false

// Logical Negation Operator
!true
!false


// Combining Logical Operators
let enteredDoorCode = false
let passedRetinaScan = false
let hasDoorKey = true
let knowsOverridePassword = false


// 여기서 문을 열기 위한 조건은?
           
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print("Open the door")
} else {
  print("Can't open the door")
}

// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  // ...
} else {
  // ...
}

/*:
 ## Question
 - 논리 연산자는 순서에 주의 필요. 순서를 신경 써야 하는 이유는?
 */

func returnTrue1() -> Bool {
    print("returnTrue1")
    print("function called")
    return true
}

func returnTrue2() -> Bool {
    print("returnTrue2")
    print("function called")
    return true
}

func returnTrue3() -> Bool {
    print("returnTrue3")
    print("function called")
    return true
}

func returnTrue4() -> Bool {
    print("returnTrue4")
    print("function called")
    return true
}

// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?
// 우선순위 : && > ||

print("\n---------- [ Case 1 ] ----------\n")
returnTrue1() && returnTrue2() && false || true && returnTrue3()


print("\n---------- [ Case 2 ] ----------\n")
returnTrue1() && false && returnTrue2() || returnTrue3()

print("\n---------- [ Case 3 ] ----------\n")
returnTrue1() || returnTrue2() && returnTrue3() || false && returnTrue4()


/*:
 ---
 ## Range Operators
 ---
 */
print("\n---------- [ Range Operators ] ----------\n")

// Closed Range Operator
0...100

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
0..<100

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {   // 0,1,2,3
  print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
1...
...100
..<100


//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...]
names[...2]
names[..<2]


/*:
 ## Question
 - 범위 연산의 순서를 반대로(내림차순) 적용하려면?
 */
// Q. 아래 코드로 테스트
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}




/*:
 ---
 ### Answer
 ---
 */
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}
print()

for index in stride(from: 5, through: 1, by: -1) {
  print("\(index) times 5 is \(index * 5)")
}
print()


// 함수를 쓰지 않고 역순 구하는 방법

let range = 1...5
type(of: range)
range.lowerBound
range.upperBound

for index in range {
  let num = range.upperBound - index + range.lowerBound
  print("\(num) times 5 is \(num * 5)")
}


//: [Next](@next)