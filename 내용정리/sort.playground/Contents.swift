//import UIKit
//
//let sequence = 1 ..< 100+1
//
//
///*
// Bubble Sort
// 시간복잡도: O(n^2)
// n 개의 원소를 가진 배열을 정렬할 때, In-place sort 로 인접한 두 개의 데이터를 비교해가면서 정렬을 진행하는 방식이다. 가장 큰 값을 배열의 맨 끝에다 이동시키면서 정렬하고자 하는 원소의 개수 만큼을 두 번 반복하게 된다.
// */
//
//func bubbleSort() -> Array<Int> {
//    var randomArray = sequence.shuffled()
//    for _ in 0..<randomArray.count {
//        for j in 0..<randomArray.count-1 {
//            if randomArray[j] > randomArray[j+1] {
//                randomArray.swapAt(j, j+1)
//            }
//        }
//    }
//    return randomArray
//}
//
//func bubbleSortFlag() -> Array<Int> {
//    var randomArray = sequence.shuffled()
//    var flag: Bool
//    for i in 0..<randomArray.count {
//        flag = false
//        for j in 0..<randomArray.count-1-i {
//            if randomArray[j] > randomArray[j+1] {
//                randomArray.swapAt(j, j+1)
//                flag = true
//            }
//        }
//        if flag == false {
//            break
//        }
//    }
//    return randomArray
//}
//
//
////print(bubbleSort())
////print(bubbleSortFlag())
//
//
///*
// Selection Sort
// 시간복잡도: O(n^2)
// n 개의 원소를 가진 배열을 정렬할 때, 계속해서 바꾸는 것이 아니라 비교하고 있는 값의 index 를 저장해둔다. 그리고 최종적으로 한 번만 바꿔준다.
// */
//
//func selectionSort() -> Array<Int> {
//    var randomArray = sequence.shuffled()
//    var value: Int
//    var location: Int
//    for i in 0..<randomArray.count {
//        value = randomArray[i]
//        location = i
//        for j in i+1..<randomArray.count {
//            // 제일 작은값 찾는중
//            if value > randomArray[j] {
//                value = randomArray[j]
//                location = j
//            }
//        }
//        // 완전순회 후 변경
//        randomArray.swapAt(i, location)
//    }
//    return randomArray
//}
//
//
////selectionSort()
//
//
///*
// Insertion Sort
// 시간복잡도: O(n^2)
// n 개의 원소를 가진 배열을 정렬할 때, i 번째를 정렬할 순서라고 가정하면,
// 0 부터 i-1 까지의 원소들은 정렬되어있다는 가정하에,
// i 번째 원소와 i-1 번째 원소부터 0 번째 원소까지 비교하면서 i 번째 원소가 비교하는 원소보다 클 경우 서로의 위치를 바꾸고,
// 작을 경우 위치를 바꾸지 않고 다음 순서의 원소와 비교하면서 정렬해준다.
// 이 과정을 정렬하려는 배열의 마지막 원소까지 반복해준다.
// */
//
//
//func insertionSort() -> Array<Int> {
//    var randomArray = sequence.shuffled()
//    var pivot: Int
//    var pivotValue: Int
//    for i in 1...randomArray.count-1 {
//        pivot = i
//        pivotValue = randomArray[i]
//        while pivot > 0 && randomArray[pivot-1] > pivotValue {
//            randomArray.swapAt(pivot, pivot-1)
//            pivot -= 1
//        }
//    }
//    return randomArray
//}
//
//insertionSort()



import Foundation

//func solution(_ answers:[Int]) -> [Int] {
//    let man1 = [1,2,3,4,5]
//    let man2 = [2,1,2,3,2,4,2,5]
//    let man3 = [3,3,1,1,2,2,4,4,5,5]
//    var scores: [Int:Int] = [1:0,2:0,3:0]
//
//    for i in 0..<answers.count {
//        if man1[i % 5] == answers[i] {
//            scores[1] = (scores[1] ?? 0) + 1
//        }
//        if man2[i % 8] == answers[i] {
//            scores[2] = (scores[2] ?? 0) + 1
//        }
//        if man3[i % 10] == answers[i] {
//            scores[3] = (scores[3] ?? 0) + 1
//        }
//    }
//    let ordered = scores.sorted(by: <)
//    print(ordered.max(by: {$0.1 < $1.1 }))
//    for i in ordered {
//        print(i)
//    }
//    print("-------------")
//
//    return [1]
//


//}
//
//solution([1,3,2,4,2])
//solution([1,2,3,4,5])
//solution([9,9,9,9,9])



/*
1. 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
e.g.  123 -> 6 ,  5678 -> 26
2. 하샤드 수 구하기
- 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.

*/

//func solution(_ input: Int) -> Bool {
//    var innerInput = input
//    var result = 0
//
//    while innerInput != 0 {
//    result += innerInput%10
//    innerInput = innerInput/10
//    }
//
//    return result / input == 0 ? true : false
//}

