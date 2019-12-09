# Type Check

## 타입확인  - type(of: )

```swift
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])  -> Int
type(of: anyArr[1]) -> Dobule
type(of: anyArr[2]) -> String
```

## Any, Generic

### Any

무슨 타입이든지 담을 수 있는 타입

```swift
// Any
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])
type(of: anyArr[1])
type(of: anyArr[2])
```

### Generic

값이 들어오는 순간 타입을 결정한다.

```
// Generic
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}

printGenericInfo(1)
printGenericInfo(2.0)
printGenericInfo("3")
```

> 함수 파라미터의 T는 관용적인것이며 변경해서 사용 가능하다.
> 단, 입력받는 모든 파라미터의 타입은 동일해야한다.

## 타입비교 - is

객체 is 객체의 타입 -> Bool (true or false)

```swift
let number = 1
number == 1    // 값 비교
number is Int  // 타입 비교
```

### 상속관계 조회

`자식 클래스 is 부모 클래스 ` -> `true`
` 부모 클래스 is 자식 클래스`  -> `false`


```swift
class Human {
  var name: String = "name"
}

class Baby: Human {
  var age: Int = 1
}

class Student: Human {
  var school: String = "school"
}

class UniversityStudent: Student {
  var univName: String = "Univ"
}

let student = Student()
student is Human -> always true
student is Baby -> always false
student is Student -> always true
```
> `student`와 `baby`는 같은 부모를 상속받은 동등관계이다.

# Type Casting

- as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
- as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
- as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생

## 업캐스팅

```swift
class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

(rect as Shape)
(rect as Shape).color

(rect as Rectangle)
(rect as Rectangle).color

```


 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 
> 자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용


## 다운캐스팅

 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용

```swift
let shapeRect: Shape = Rectangle()
var downcastedRect: Rectangle? = Rectangle()


downcastedRect = shapeRect as Rectangle // 실패

downcastedRect = shapeRect as? Rectangle  //
downcastedRect = shapeRect as! Rectangle  //
```
