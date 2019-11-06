# Linked_List

## Single_Linked_List

1. insert
2. search
3. delete

1) append(data) -> `None`

2) empty() -> `bool`

	i. 비어있으면 True
	ii. 아니면 False
	
3) size() -> `integer`

4) traverse(node='next') -> node

```
node는 'first' 첫번째 노드
		'next' 함수를 호출할 때마다 다음 노드들을 순회하면서 반환
```

5) remove () -> node


# fffff


```
traverse를 통해 찾은 데이터를 삭제하고 넘겨줌
```
```
### 자료구조와 알고리즘 ###

자료구조 :

알고리즘 :

### 재귀함수 ###
1. 배열의 원리 - 배열이란 동일한 자료형을 가진 변수들의 모임 - 배열은 수정이 불가능하다. (한 번 길이가 정의되면 수정할 수 없음) - 배열은 탐색하고자할 때 인덱스로 순차없이 바로 접근가능 - 데이터 추가, 삭제가 없고 접근이 빈번할 때는 배열을 사용할 것. - 배열로 정의할 상황에서는 linked list를 사용하지 않는 것이 좋다. - 배열은 할당할 때 메모리에 순차적으로 할당하기 때문에 (한 페이지에) 상대적으로 빠르다.

2. Linked List - 탐색시 처음부터 순차적으로 탐색해야 한다. - 접근을 잘 안하지만 데이터를 자주 추가/삭제할 때는 linked list를 사용할 것 - Linked List는 탐색 참조기 때문에 상황에 따라 매우 느릴 때가 있다.

3. reculsion (재귀함수) - 함수 정의 내에서 똑같은 함수를 다시 호출하는 것 - 탈출 조건을 반드시 넣어주어야 함 - factorial(계승)은 0!와 1!는 같다 (1) 

4. generator ot iterater (찾아서 정리 해라) - 게으른 연산(요구를 할 때만 연산을 하고 메모리를 미리 가지고 있지 않는다.) - iterator의 종류의 하나 (코루틴 공부할 것)

### 탐색 기초 ###

1. Linear search(선형 탐색) - 요소 하나하나를 for문과 if문으로 차례대로 돌면서 찾음  - if 문의 성능 결정의 핵심 (if 문의 메모리는 엄청나게 크다)
2. Binary search(2진 탐색) - 2진 탐색은 정렬된 구조에서만 탐색이 가능하다. 

### 성능 검사(bigO) ###
1. 선형 탐색은 데이터 개수가 n개로 늘어날 때 마다 비교횟수도 늘어난다. 우측 상향 곡선 

2. (quick sort를 제외한 나머지의) 모든 알고리즘의 성능의 지표는 최악의 경우 lon(n)의 시간을 보장하는 것이 원칙

3. 2중 for 문은 무조건 n2

### !! ADT(Abstract Data Type: 추상 자료형) !! ###
- 자료구조를 구성하는데에 필요한 함수 인터페이스 목록
- 인터페이스란 함수 이름과 인자 목록, 반환 값을 명시해놓은 것(구현이 아님)
- 구현부와 인터페이스를 나누는 것이 ‘추상화’ 이다.



### single linked list ###
1. 노드 - data부와 (다음 데이터를 가리키는)참조부로 이루어 짐 

2. Linked_list ADT - append(data) -> None (리스트 담당 append 인터페이스로 자료구조의 insert에 해당) - empty() -> bool (비어있으면 True, 그렇지 아니하면 False) - size() -> integer (데이터의 개수 인티저로 반환) - traverse(mode=‘next’) -> data (자료구조의 search에 해당 (노드에는 first 와 next가 있으며 first는 첫 번째 데이터를 가진 노드, next 함수 호출 시 해당 데이터 다음부터 순회를 하면서 반환) -  remove() -> data (자료구조의 delete에 해당, traverse에서 찾은 데이터 삭제, 삭제한 데이터 넘겨줌) 

3. Linked_list 구성 - head(맨 앞을 가리킴) - before(현재 위치 전) - current(현재 탐색 위치) - tail(맨 뒤를 가리킴) - 데이터의 개수

### dummyed list ###
- def __init__ (self) -> 생성자 (constructor) : 객체를 만들 때 반드시 한 번은 호출 됨
- def __del__ (self)-> 소멸자 (destructor) : 객체를 지울 때 반드시 한 번은 호출 됨 파이썬 내에 자체적으로 가비지 컬렉션 기능이 있어서 알아서 파이썬에서 지워주기 때문에 __del__을 쓸 일은 없다.

### reference counting ###
- reference count를 지정하는 기법
- sys.getrefcount(해당 오브젝트)로 표현 (import sys)
- reference = 참조 / refrence count = 참조된 횟수

### garbage collection ###
- 접근할 수 없는 (사용할 수 없는, 쓸모 없는) 메모리 공간을 삭제
- ex) n = Node()의 경우 n으로 접근이 되지만 Node()만 써서는 접근 불가 -> 사용 불가, 쓸모 x -> 파이썬 소멸자 자동 호출 삭제

### 컴파일러 언어와 인터프린터 언어의 차이 ###
1. 컴파일 언어 - 컴파일 언어는 모든 메모리 공간(code, data, heap, stack) - 전역 변수 -> data 영역, 지역 변수 -> stack (인터프린터 언어는 모조리 heap) 

2. 인터프린터 언어 - 인터프린터 언어는 heap공간만을 사용한다 - 우리가 실질적으로 사용하는 메모리 공간은 heap의 private heap이다. - c나 java같은 컴파일 언어로 만들어진 단순 실행 파일 - 실행 시 os에게 저장소 요청 -> os가 heap을 굉장히 크게 설정해서 할당해줌 - 전역 변수도 heap에 할당 됨

### 파이썬의 구조 ###
1. 컴파일러 - lexer  - parser  - ast (abstact syntax tree) : lexer -> parser로 이동할 때 사용

### 메모 ###
- ==는 값만 비교 is는 주소값까지 비교
- ex> a = 1024, b = 1024 일 때 a == b 는 True, a is b 는 False가 나온다.
```