//: [Previous](@previous)
/*:
 # Type Conversion
 */

let height = Int8(5)
let width = 10
//let area = height * width
//print(area)


let h = Int8(12)
//let x = 10 * h
//print(x)

/*:
 ---
 ## Question
 - 8번째 라인 let area = height * width  부분은 에러가 발생하고
 - 13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?
 ---
 */

let num = 10
let floatNum = Float(num)
type(of: floatNum)

let signedInteger = Int(floatNum)
type(of: signedInteger)

let str = String(num)
type(of: str)


let anInteger: Int = -15
let absNum = abs(anInteger)
type(of: absNum)


//: [Next](@next)
