//: [Previous](@previous)

import UIKit

final class MemoryViewController: UIViewController {
  
  final class Person {
    weak var apartment: Apartment?
    let name: String
    
    init(name: String) {
      self.name = name
    }
    
    deinit {
      print("\(name) is being deinitialized")
    }
    
  }
  
  final class Apartment {
    var tenant: Person?
    let unit: String
    
    init(unit: String) {
      self.unit = unit
    }
    deinit {
      print("Apartment \(unit) is being deinitialized")
    }
  }
  
  // 서로 순환참조가 발생함
  var person: Person? = Person(name: "James") // count 1
  var apartment: Apartment? = Apartment(unit: "3A") // count 1
  
  func loadClass() {
    person?.apartment = apartment // apt count ++
    apartment?.tenant = person // person count ++
  }
  
  deinit {
    print("MemoryViewController is being deinitialized")
  }
}


var memoryVC: MemoryViewController? = MemoryViewController() //memoryVC count 1
memoryVC?.loadClass()
memoryVC = nil // memoryVC --


/***************************************************
 1. 문제가 있는지 없는지 확인
 2. 문제가 없다면 참조카운트가 어떻게 바뀌면서 잘 해결이 되었는지 정리하고
    문제가 있다면 어떤 부분이 그런지 알아보고 직접 해결해 볼 것
 ***************************************************/



//: [Next](@next)
