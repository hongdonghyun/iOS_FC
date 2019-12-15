//: [Previous](@previous)
/*:
 # Type Casting
 ---
 - as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 - as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 - as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 ---
 */

import UIKit

class Shape {
}

class Rectangle: Shape {
}

class Triangle: Shape {
}

/***************************************************
 Shape
  - Rectangle
  - Triangle
  - Circle
 모두 draw() 오버라이드
 ***************************************************/


/*:
 ---
 ## Upcasting
 ---
 */
print("\n---------- [ Upcasting ] ----------\n")

/***************************************************
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
 ***************************************************/


let rect = Rectangle()
//rect.color
//rect.cornerRadius
rect as Shape
(rect as Shape)
//(rect as Shape).color
//(rect as Shape).cornerRadius
(rect as Rectangle)
//(rect as Rectangle).color
//(rect as Rectangle).cornerRadius



let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //

//upcastedRect.color
//upcastedRect.cornerRadius

//(upcastedRect as Shape).color
// 부모에서 자식으로 접근하려고 함
// 부모 -> 자식
// 자식클래스는 부모 클래스가 무조건 하나
// 부모클래스는 자식이 몇명인지 모름
// 다운캐스팅을 사용해야한다.
//(upcastedRect as Rectangle).color


/*:
 ---
 ## Downcasting
 ---
 */
print("\n---------- [ Downcasting ] ----------\n")

/***************************************************
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 ***************************************************/


let shapeTriangle: Shape = Triangle()
//var downcastedRect: Rectangle? = Rectangle()

//downcastedRect = shapeRect //
//downcastedRect = shapeRect as Rectangle
//
print(shapeTriangle as? Triangle)
print(shapeTriangle as? Rectangle)

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생



//Q. 아래 value 에 대한 Casting 결과는?
let value = 1

//(value as Float) is Float   //
//(value as? Float) is Float  //ㅁㅇ
//(value as! Float) is Float  //


/*:
 ---
 ## Type Check Operator
 ---
 */
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()

let list = [shape, rectangle, triangle]
/*:
 ---
 ### Question
 - 아래 for 문에 대한 실행 결과는?
 ---
 */
//for elem in list {
//  if elem is Shape {
//    print("shape instance")
//  } else if elem is Rectangle {
//    print("rect instance")
//  } else if elem is Triangle {
//    print("triangle instance")
//  }
//}



print("\n---------- [ ] ----------\n")

// let list: [Shape] = [shape, rectangle, triangle]
//for element in list  {
//  element.draw()
//}


//: [Next](@next)
