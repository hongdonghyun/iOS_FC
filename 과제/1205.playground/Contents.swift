/*
func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)
위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
task1 + task1
*/


func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}

let task1: Any = addTwoValues(a: 2, b: 3)
((task1 as? Int) ?? 0) + (task1 as! Int)

/*
과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
두 변수의 더하기 연산이 제대로 동작하도록 할 것
(addTwoValues의 각 파라미터에는 원하는 값 입력)
 */
let task2: Any = addTwoValues

//(task2 as! (Int,Int) -> Int) (1,2) + (task2 as! (Int,Int) -> Int) (1,2)

if let task2 = task2 as? (Int, Int) -> Int {
    task2(1,2) + task2(1,2)
}




/*
 2.
 class Car {}
 let values: [Any] = [
   0,
   0.0,
   (2.0, Double.pi),
   Car(),
   { (str: String) -> Int in str.count }
 ]
 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
 for value in values {
   switch value {
     // Code 구현
   }
 }
*/

class Car {}
let values: [Any] = [
  0,
  0.0,
  (2.0, Double.pi),
  Car(),
  { (str: String) -> Int in str.count }
]
 

for value in values {
    
    switch value {
    case let x where ((x as? Int) != nil):
        print("\(x) is Int")
    case let x where ((x as? Double) != nil):
        print("\(x) is Double")
    case let x where ((x as? (Double,Double)) != nil):
        print("\(x) is tuple")
    case let x where ((x as? Car) != nil):
        print("\(x) is Car class")
    case let value where ((value as? (String) -> Int) != nil):
        print("\(value) is Closure")
    default:
        print("Error type is\(type(of: value))")
    }
}

/*
1. 생성자 구현
*/

// - Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가

class Vehicle {
    let name: String
    let maxSpeed: Int
    
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
    
    init() {
        self.name = "Benz"
        self.maxSpeed = 100
    }
}


// - Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
class Car2: Vehicle {
    var modelYear: Int
    var numberOfSeats: Int
    
    
    init?(modelYear: Int, numberOfSeat: Int, name: String = "Benz", maxSpeed: Int = 300) {
        guard modelYear > 0 , numberOfSeat > 0 else { return nil }
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeat
        super.init(name: name,maxSpeed: maxSpeed)

    }
}



// - Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가
class Bus: Vehicle {
  let isDoubleDecker: Bool
    
    init(isDoubleDecker: Bool,name: String, maxSpeed: Int) {
        self.isDoubleDecker = isDoubleDecker
        super.init(name: name, maxSpeed: maxSpeed)
    }
    
    convenience init(name: String, isDoubleDecker:Bool) {
        self.init(isDoubleDecker: isDoubleDecker, name: name, maxSpeed: 100)
        
    }
}

let v = Vehicle()
let v2 = Vehicle(name: "audi", maxSpeed: 50)
v.name
v2.name
v.maxSpeed
v2.maxSpeed

if let c = Car2(modelYear: 2019, numberOfSeat: 0) {
    c
} else {
    if let c2 = Car2(modelYear: 2019, numberOfSeat: 2) {
        c2.modelYear
        c2.numberOfSeats
        c2.name
        c2.maxSpeed
    }
}

let b = Bus(name: "Volvo",isDoubleDecker: false)
b.name
b.maxSpeed
b.isDoubleDecker
