//: [Previous](@previous)
//: - - -
//: # Abstraction
//: - - -

protocol Human {
  var name: String { get }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }
  
  func sleep()
  func eat()
  func walk()
}

//class User: Human {
//}



protocol Jumpable {
  var canJump: Bool { get set }
  var jumpHeight: Double { get }
}

class Cat: Jumpable {
//  let canJump = true  // get
  var canJump = true  // get set
  
  private var _jumpHeight = 30.0
  var jumpHeight: Double {
    get { _jumpHeight }
//    set { _jumpHeight = newValue }
  }
}

let cat = Cat()
if cat.canJump {
  print(cat.jumpHeight)
}


/*:
 ---
 ### Question
 추상화 적용해보기 (Protocol 로 표현)
 - 사람(Human)을 표현하는 속성과 동작 정의
 - 레스토랑을 운영하는 오너(Owner)의 속성과 동작 정의
 - 요리사(Chef)의 속성과 동작 정의
 - 손님(Customer)의 속성과 동작 정의
 ---
 */

protocol Human2 {
    var name: String { get }
    var gender: String { get set }
    var width: Double { get set }
    var height: Double { get set }
    var country: String { get set }
    
    func info()
}

class Hong3: Human2 {
    var name: String
    
    var gender: String
    
    var width: Double
    
    var height: Double
    
    var country: String
    
    init(name: String, gender: String, width: Double, height: Double, country: String) {
        self.name = name
        self.gender = gender
        self.width = width
        self.height = height
        self.country = country
    }
    
    func info() {
        print(self.name)
        print(self.gender)
        print(self.width)
        print(self.height)
        print(self.country)
    }
}



/*:
 ---
 ### Answer
 ---
 */

// 사람을 표현하는 속성과 동작 정의
protocol Human1 {
  var name: String { get }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }
  
  func sleep()
  func eat()
  func walk()
}

// 레스토랑을 운영하는 오너의 속성과 동작 정의
protocol Owner1 {
  var name: String { get }
  
  func promote()
  func hire()
  func fire()
}


// 요리사의 속성과 동작 정의
protocol Chef1 {
  var position: String { get }
  
  func cook()
  func decorate()
  func buyFoodIngredients()
}

// 손님의 속성과 동작 정의
protocol Customer1 {
  var money: Int { get }
  
  func order()
  func eat()
  func rateRestaurant()
}


//: [Next](@next)
