//: [Previous](@previous)
/*
 싱글톤 방식으로 해보기 전에
 아래에 주어진 코드를 이용해 User에 친구 추가하기
 */

class User {
    var friends: [Friends] = []
    var blocks: [Friends] = []
}

struct Friends: Equatable {
    let name: String
}



/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

class FriendList {
    var user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    func addFriend(name: String) {
        user.friends.append(Friends.init(name: name))
    }
    
    func blockFriend(name: String) {
        user.blocks.append(Friends.init(name: name))
        
        for (index,value) in user.friends.enumerated() {
            if value.name == name {
                user.friends.remove(at: index)
            }
        }
    }
}

let user = User()

var friendList = FriendList(user)
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
user.friends   // 원빈, 장동건, 정우성

friendList.blockFriend(name: "정우성")
user.friends   // 원빈, 장동건
user.blocks    // 정우성


//: [Next](@next)
