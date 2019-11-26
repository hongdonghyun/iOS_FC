//: [Previous](@previous)

/*
 1. width, height 속성을 가진 Rectangle 클래스 정의
 2. 생성자에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형 가로와 세로의 길이를 반환하는 메서드 구현
 5. 사각형의 넓이를 반환하는 메서드 구현
 6. 다음과 같은 속성을 지닌 인스턴스 생성
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 */

class Rectangle {
    private var width: Double
    private var height: Double
    var area: Double {
        return width * height
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func getWidth() -> Double {
        return self.width
    }
    
    func getHeight() -> Double {
        return self.height
    }
    
    func setWidth(width: Double) {
        self.width = width
    }
    
    func setHeight(height: Double) {
        self.height = height
    }
}

var rec1 = Rectangle(width: 10.0, height: 5.0)
print(rec1.getWidth())


/*
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 변경 가능한 메서드 구현
 3. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
    (직접 프로퍼티에 값을 설정할 수 없다고 가정)
 5. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
 */

class TV {
    private var channel: Int = -1
    private var volume: Int = -1
    var power: Bool = false
    
    func getChannel() -> Int {
        if self.power {
            return self.channel
        } else { return -1 }
    }
    
    func getVolume() -> Int {
        if self.power {
            return self.volume
        } else { return -1 }
    }
    
    func setChannel(_ channel: Int) {
        if self.power {
            self.channel = channel
        } else { print("power off") }
        
    }
    
    func setVolume(_ volume: Int) {
        if self.power {
            self.volume = volume
        } else { print("power off") }
    }
}

var tv = TV()
tv.setVolume(3)


/*
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 */

class Square {
    var height: Double? = nil
    var width: Double = 0
    
    func setHeight(height: Double) {
        self.height = height
    }
    
    func getPerimeter() {
        if let height = self.height {
            print("둘레 :\((height + self.width) * 2)")
        } else {
            print("높이를 지정하세요.")
        }
    }
    
    func getArea() {
        if let height = self.height {
            print("넓이 :\(height * self.width)")
        } else {
            print("높이를 지정하세요.")
        }
    }
    
}


class Circle {
    var radius: Double? = nil
    
    func setRadius(radius: Double) {
        self.radius = radius
    }
    
    func getPerimeter() {
        if let radius = self.radius {
            print("원의 둘레:\(radius * 2 * 3.14)")
        } else {
            print("반지름을 입력하세요.")
        }
    }
    
    func getArea() {
        if let radius = self.radius {
            print("원의 넓이:\(radius * radius * 3.14)")
        } else {
            print("반지름을 입력하세요.")
        }
    }
}


/*
 1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
   구현 내용은 자유롭게
 */

class Dog {
    /*
    ** 강아지 (Dog)
    - 속성: 이름, 나이, 몸무게, 견종
    - 행위: 짖기, 먹기
    */
    var name: String =  ""
    var age: Int = 0
    var weight: Double = 0.0
    var kind: String = ""
    
    func bark() {
        print("야옹")
    }
    
    func eat() {
        print("쳐묵쳐묵")
        
    }
}

class Student {
    /*
    ** 학생 (Student)
    - 속성: 이름, 나이, 학교명, 학년
    - 행위: 공부하기, 먹기, 잠자기
    */
    
    var name: String = ""
    var age: UInt = 0
    var school: String = ""
    var schoolYear: UInt = 0
    
    func study() {
        print("빡공")
    }
    
    func eat() {
        print("처묵처묵")
    }
    
    func sleep() {
        print("쿨쿨")
        
    }
}

class Iphone {
    /*
     ** 아이폰(IPhone)
     - 속성: 기기명, 가격, faceID 기능 여부(Bool)
     - 행위: 전화 걸기, 문자 전송
     */
    
    var device: String = ""
    var price: Int = 0
    var faceID: Bool = false
    
    func call() {
        print("따르릉")
    }
    func sms() {
        print("문자")
    }
}

class Coffee {
    /*
     ** 커피(Coffee)
     - 속성: 이름, 가격, 원두 원산지
     */
    var name: String = ""
    var price: Int = 0
    var origin: String = ""
    
}

/*
2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기

** 계산기 (Calculator)
- 속성: 현재 값
- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
*/

class Calculator {
    var value: Double = 0
    func add(_ add: Double) -> Double {
        self.value += add
        return self.value
    }
    func subtract(_ sub: Double) -> Double {
        self.value -= sub
        return self.value
    }
    func multiply(_ mul: Double) -> Double {
        self.value *= mul
        return self.value
    }
    func divide(_ div: Double) -> Double {
        self.value /= div
        return self.value
    }
    func reset() -> Double {
        self.value = 0
        return self.value
    }
}

let calculator = Calculator() // 객체생성

calculator.value  // 0
calculator.add(10)    // 10
calculator.add(5)     // 15

calculator.subtract(9)  // 6
calculator.subtract(10) // -4

calculator.multiply(4)   // -16
calculator.multiply(-10) // 160

calculator.divide(10)   // 16
calculator.reset()      // 0



/*
3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
*/

class Poly {
    var width: Double?
    var height: Double?
    var length: Double?
    var radius: Double?
    var upperWidth: Double?
    var pi: Double = 3.14
    var A: Double? = nil
    var P: Double? = nil
    var C: Double? = nil
    var V: Double? = nil
    
    
    init(width: Double? = nil,upperWidth: Double? = nil, length: Double? = nil, height: Double? = nil,radius: Double? = nil, poly: Int?) {
        switch poly {
        // square
        case 0:
            if let w = width {
                self.A = w * w
                self.P = 4 * w
            }
        // rectangle
        case 1:
            if let w = width, let h = height {
                self.A = w * h
                self.P = (2 * w) + (2 * h)
            }
        case 2:
            if let r = radius {
                self.A = self.pi * (r * r)
                self.C = 2 * self.pi * r
            }
        case 3:
            if let w = width, let h = height {
                self.A = 0.5 * w * h
            }
        case 4:
            if let uw = upperWidth, let w = width, let h = height {
                self.A = 0.5 * h * ( uw + w )
            }
        case 5:
            if let w = width {
                self.V = w * w * w
            }
        case 6:
            if let w = width, let l = length, let h = height {
                self.V = w * l * h
            }
        case 7:
            if let r = radius, let h = height {
                self.V = self.pi * (r * r) * h
            }
        case 8:
            if let r = radius {
                
                self.V = 1.3 * self.pi * (r * r * r)
            }
        case 9:
            if let r = radius, let h = height {
                self.V = 0.3 * self.pi * (r * r) * h
            }
        default:
            self.width = 0
            self.height = 0
            
        }
    }
    
    func getResult() {
        print("--------------------")
        print("넓이(A): ", self.A ?? 0)
        print("둘레(P): ", self.P ?? 0)
        print("원의둘레(C): ", self.C ?? 0)
        print("부피(V): ", self.V ?? 0)
    }
}

for i in 0...9 {
    print(i)
    Poly(width: 5,upperWidth: 5, length: 5, height: 5,radius: 4, poly: i).getResult()
}



//: [Next](@next)
