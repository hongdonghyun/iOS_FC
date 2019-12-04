import Cocoa

let star = "*"
let blank = " "

// 1.
//for i in 1...5 {
//    print(String(repeating: star, count: i))
//}

// 2.
//for i in 1...5 {
//    print(String(repeating: blank, count: 5-i),terminator: "")
//    print(String(repeating: star, count: (2 * i)-1))
//}


// 3.
//for i in 1...5 {
//    print(String(repeating: blank, count: 5-i),terminator: "")
//    print(String(repeating: star, count: (2 * i)-1))
//}
//for j in stride(from: 5, to: 0, by: -1) {
//    print(String(repeating: blank, count: 5-j),terminator: "")
//    print(String(repeating: star, count: (2 * j)-1))
//}

func multiple(_ a: Int, _ b: Int) -> Int {
    if a > 0 {
        if b > 0 {
            return a * b
        } else {
            return -1
        }
    } else {
        return -1
    }
}

