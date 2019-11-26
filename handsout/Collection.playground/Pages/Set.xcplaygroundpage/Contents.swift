//: [Previous](@previous)
/*:
 ## Set
 - Unordered Collection
 - Unique Value
 - Set Literal = Array Literal
 */
//// 배열 / 딕셔너리에 비해 중요도 ↓
//
//
////let fruitsArr = ["Apple", "Orange", "Melon"]
////let numbersArr = [1, 2, 3, 3, 3]
////let emptyArr = [String]()
//
//
//let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
//let numbers: Set = [1, 2, 3, 3, 3]
//let emptySet = Set<String>()
//
//
///*:
// ### Number of Elements
// */
//fruitsSet.count
//
//if !fruitsSet.isEmpty {
//  print("\(fruitsSet.count) element(s)")
//} else {
//  print("empty set")
//}
//
///*:
// ### Searching
// */
//print("\n---------- [ Searching ] ----------\n")
//
//
//
//let x: Set = [1, 2, 3, 4, 5]
//let y: Set = [1, 2, 3, 4, 5]
//x
//y
//
////fruitsSet[0]    // 순서 X -> Index X
//x.first   // O
//
//
//if fruitsSet.contains("Apple") {
//  print("Contains Apple")
//}
//
//let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
//for element in productSet {
//  if element.hasPrefix("i") {
//    print(element)
//  }
//}
//
//
///*:
// ### Add a New Element
// */
//print("\n---------- [ Add ] ----------\n")
//
////[1,2,3].append(1)
////[1,2,3].insert(2, at: 0)
//
//var stringSet: Set<String> = []
//stringSet.insert("Apple")
//stringSet
//
//stringSet.insert("Orange")
//stringSet
//
//stringSet.insert("Orange")
//stringSet
//
//
///*:
// ### Remove an Element
// */
//print("\n---------- [ Remove ] ----------\n")
//
//stringSet = ["Apple", "Orange", "Melon"]
//
//stringSet.remove("Apple")
//
//if let removed = stringSet.remove("Orange") {
//  print("\(removed) has been removed!")
//}
//
//stringSet
//
//stringSet.removeAll()
//
//
///*:
// ### Compare two sets
// */
//print("\n---------- [ Compare ] ----------\n")
//
//var favoriteFruits = Set(["Apple", "Orange", "Melon"])
//var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
//
//if favoriteFruits == tropicalFruits {
//  print("favoriteFruits == tropicalFruits")
//} else {
//  print("favoriteFruits != tropicalFruits")
//}
//
//
//var favoriteFruits1 = Set(["Orange", "Melon", "Apple"])
//var favoriteFruits2 = Set(["Apple", "Melon", "Orange"])
//
//favoriteFruits1 == favoriteFruits2
//favoriteFruits1.elementsEqual(favoriteFruits2)
//
//
//
//// 포함 관계 여부. 상위/하위 집합.
//// group1 ⊇ group2
//let group1: Set = ["A", "B", "C"]
//let group2: Set = ["A", "B"]
//
//// superset
//group1.isSuperset(of: group2)
//group1.isStrictSuperset(of: group2)
//// strictSuperset - 자기 요소 외 추가 요소가 최소 하나 이상 존재해야 함
//group1.isStrictSuperset(of: group1)
//
//// subset
//group2.isSubset(of: group1)
//group2.isStrictSubset(of: group1)
//group2.isStrictSubset(of: group2)
//
//
///*:
// ---
// ## Fundamental Set Operations
// - intersection - 교집합
// - symmetricDifference - 교집합의 여집합
// - union - 합집합
// - subtracting - 차집합
// ---
// */
//
////: ![Set](FundamentalSetOperations.png)
//
//
//
///*:
// ### intersection
// */
//print("\n---------- [ intersection ] ----------\n")
//
//
//favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
//tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
//
//// isDisjoint - 공집합일 경우 true 반환
//if favoriteFruits.isDisjoint(with: tropicalFruits) {
//  print("favoriteFruits ∩ tropicalFruits = ∅")
//} else {
//  print("favoriteFruits ∩ tropicalFruits")
//}
//
//// 교집합에 해당하는 요소를 반환
//let commonSet = favoriteFruits.intersection(tropicalFruits)
//commonSet
//
//// 교집합에 해당하는 요소만 남기고 나머지 제거
//tropicalFruits.formIntersection(favoriteFruits)
//tropicalFruits
//
//
//
///*:
// ### symmetricDifference
// */
//print("\n---------- [ symmetricDifference ] ----------\n")
//
//favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
//tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
//
//// 교집합의 여집합 요소들을 반환
//let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
//exclusiveSet
//
//// 교집합의 여집합 요소들로 데이터 변경
//favoriteFruits.formSymmetricDifference(tropicalFruits)
//favoriteFruits
//
//
///*:
// ### union
// */
//print("\n---------- [ union ] ----------\n")
//
//favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
//tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
//
//// 합집합 반환
//var unionSet = favoriteFruits.union(tropicalFruits)
//unionSet
//
//// 합집합 요소들로 데이터 변경
//favoriteFruits.formUnion(tropicalFruits)
//favoriteFruits
//
///*:
// ### subtracting
// */
//print("\n---------- [ subtracting ] ----------\n")
//
//favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
//tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
//
//// 차집합 반환
//let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
//uncommonSet
//
//// 교집합 요소 제거
//favoriteFruits.subtract(tropicalFruits)
//favoriteFruits



/*
 <1>
 [보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
 위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
 */


func findFruit() -> Array<String> {
    let studentDictionary = ["철수":"apple","영희":"banana","진수":"grape","미희":"strawberry"]

    var resultArray: Array<String> = []
    for (name, fruit) in studentDictionary {
        if fruit.contains("e") {
            resultArray.append(name)
        }
    }
    return resultArray
}

print(findFruit())



/*
 <2>
 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
 */

func sortArray(_ input: Array<Int>) -> Array<Int> {
    var oddArray: Array<Int> = []
    var evenArray: Array<Int> = []
    for i in input {
        if i % 2 == 0 {
            evenArray.append(i)
        } else {
            oddArray.append(i)
        }
    }
    return oddArray + evenArray
}

print(sortArray([2, 8, 7, 1, 4, 3]))


/*
<3>
0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
입력 : [1, 3, 3, 3, 8]
결과 : "숫자 1 : 1개, 숫자 3 : 3개, 숫자 8 : 1개"
*/

func numberCount2( _ input: [Int]) -> String {
    var resultDict: [Int: Int] = [:]
    for i in input {
        /* 1번
        if resultDict[i] == nil {
            resultDict[i] = 1
        }
        else {
            resultDict[i]! += 1
        }*/
        /* 2번*/
        if let value = resultDict[i] {
            resultDict[i] = value + 1
        } else {
            resultDict[i] = 1
        }
    }
    
    return "dmdkdkdkdk"
}

numberCount2([1,3,3,3,8])


func numberCount(_ input: Array<Int>) -> String {
    var counter: [Int: Int] = [:]
    var resultString: String = ""
    for i in input {
        counter[i] = (counter[i] ?? 0) + 1
    }
    for (key, value) in counter {
        resultString += "숫자 " + String(key) + " : " + String(value) + "개, "
    }
    
    return String(resultString.dropLast(2))
}


print(numberCount([1, 3, 3, 3, 8]))


 /*
- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
  ex) 123 -> 321 , 10293 -> 39201
 */

func intReverse(_ input: Int) -> Int {
    return Int(String(String(input).reversed()))!
}

intReverse(123)
    /*
- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
  ex) true - 123, 310, 369   /  false - 100, 222, 770
 */

func diffNumber(_ input: Int) -> Bool {
    let bak = input / 100
    let sip = (input % 100) / 10
    let ill = input % 10
    
    if (bak, sip) == (sip, ill) {
        return true
    } else {
        return false
    }
}


/*
[ 도전 과제 ]
- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
  + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
*/

let sixSixTree = [
    "식육목": [
        "개과": [
            "개": [
                "자칼",
                "늑대",
                "북미산 이리",
            ],
            "여우": [
                "아메리카 여우",
                "유럽 여우",
            ]
        ],
        "고양이과": [
            "고양이": [
                "고양이",
                "살쾡이"
            ],
            "표범": [
                "사자",
                "호랑이"
            ]
        ]
    ]
]

/*
 - 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
 */

func duplicateRemove(_ input:Array<String>) -> Array<String> {
    let arrayToSet = Set(input)
    return Array(arrayToSet)
}

duplicateRemove(["a","b","c","a"])
//: [Next](@next)
