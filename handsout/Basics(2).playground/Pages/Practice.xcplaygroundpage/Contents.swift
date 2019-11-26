//: [Previous](@previous)
/*:
 # Practice
 */
/*:
 ---
 ## Conditional Statements
 ---
 */
/*
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
   (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 */

func scoreToGrade(_ score: Double) -> String {
    switch score {
        case 4.5:
            return "A+"
        case 4.0:
            return "A"
        case 3.5:
            return "B+"
        case 3.0:
            return "B"
        case 2.5:
            return "C+"
        case 2.0:
            return "D"
        case 0...2.0:
            return "F"
    default:
        return "Error"
    }
}

func intToMonth(_ month: Int) -> String {
    switch month {
        case 1...12:
            return String(month)+"월"
    default:
        return "Error"
    }
}

func threeMultiple(_ numbers: (Int, Int, Int)) -> Any {
    switch numbers {
        case let (x, y, z) where x * y * z > 0:
            return true
        case let (x, y, z) where x * y * z < 0:
            return false
        default:
            return "error"
    }

}

//scoreToGrade(4.4)
intToMonth(12)
//threeMultiple((1,2,-99))

/*:
 ---
 ## Loops
 ---
 */
/*
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
   (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
   ex) 5! = 5 x 4 x 3 x 2 x 1
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
   (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
   (1234 인 경우 각 자리 숫자를 합치면 10)
 */

func factorial(_ input: Int) -> Int {
    if input == 1 {
        return 1
    } else {
        return input * factorial(input - 1)
    }
}

factorial(5)

func mc(one:Int, two:Int) -> Int {
    var result = one
    for _ in 2...two {
        result *= one
    }
    return result
}

mc(one:2,two:5)

func countSum(_ input: Int) -> Int {
    var result = 0
    for char in String(input) {
        result += Int(String(char))!
    }
    return result
}

countSum(1234)
/*:
 ---
 ## Control Transfer
 ---
 */
/*
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 */

func addOver(_ input: Int) -> Int {
    var result: Int = 0
    for number in 1...input {
        if result > 2000 {
            break
        }
        else {
            result += number
        }
    }
    return result
}

addOver(2000)

func rangeSum(_ input: Int) -> Int {
    var result = 0
    for number in 1...input {
        if (20...30).contains(number) {
            continue
        }
        else {
            result += number
        }
    }
    return result
}


rangeSum(50)


/*
- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
 */

func stringCompare(string1: String, string2: String) -> Bool {
    return string1 == string2
}

stringCompare(string1: "123", string2: "123")

/*
- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
 */
// input의 약수 i를 찾으면
// input/i 도 약수
func intFactor(input: Int) -> Array<Int> {
    var i = 1
    var resultArray = Array<Int>()
    while i * i <= input {
        if input % i == 0 {
            resultArray.append(i)
            if i != input/i {
                resultArray.append(input/i)
            }
        }
        i += 1
    }
    return resultArray
}

intFactor(input: 100)

/*
 - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
*/

func commonMultiple() -> Array<Int> {
    var resultArray = Array<Int>()
    for i in 1...100 {
        if (i % 3 == 0) && (i % 5 == 0) {
            resultArray.append(i)
        }
    }
    return resultArray
}

commonMultiple()

/*
 - 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
(1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
*/


func intToStr(input1: Int, input2: Int) -> Int {
    let result = String(input1) + String(input2)
    return Int(result)!
}

intToStr(input1: 6, input2: 100)

/*
- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
*/
func sosu(input1: Int) -> Bool {
    for _ in 2...input1 {
        if input1 % 2 == 0 {
            return false
        }
    }
    return true
}

sosu(input1: 7)

/*
- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
*/

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

fibonacci(4)

/*
 - 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
      윤년X 예시 - 200, 300, 500, 600, 1900, 2100
 */
 
func leapYear(input1: Int) -> Bool {
    if input1 % 400 == 0 {
        return true
    } else if input1 % 100 == 0 {
        return false
    } else if input1 % 4 == 0 {
        return true
    } else {
        return false
    }
}


leapYear(input1: 200)
