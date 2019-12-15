//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
}

class Dog {
  var owner: Person?
}



var hong3: Person! = Person()
var bokgil: Dog! = Dog()

hong3.pet = bokgil
bokgil.owner = hong3



/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?
 ---
 */

/*:
 ---
 ### Answer
 ---
 */
// 순서 주의

hong3.pet = nil
bokgil.owner = nil

hong3 = nil
bokgil = nil




//: [Next](@next)
