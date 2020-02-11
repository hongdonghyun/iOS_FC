//
//  RequestHelper.swift
//  babPlus
//
//  Created by Hongdonghyun on 2020/02/05.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import Foundation

// Usage
//RequestHelper().reqTask(path: "menu", method: "GET") {
//    (result) in
//    dump(result)
//}

// MARK: - Request Struct
struct RequestHelper {
    var base_url = "https://1cr8sgkm6e.execute-api.ap-northeast-2.amazonaws.com/prod/"
    
    private func request(urlPath path:String, method: String) -> URLRequest? {
        guard let url = URL(string: base_url + path) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")    //json형식으로
        return request
    }
    
    //@escaping 한 이유는 completion이 비동기 형태임으로 데이터 다 불러오면 (BabMenu) -> () 실행
     //BabMenu, Content Decodable형태 byte Type -> dataType으로 전환 (dataType -> byte Type으로 전환할 필요가 없으므로 encodable로 사용 안함.)
    func reqTask(path: String = "menu", method: String = "GET", completion: @escaping (BabMenu) -> ()) {
        let task = URLSession.shared.dataTask(with: RequestHelper().request(urlPath: path, method: method)!) {
            data, response, error in
            if let res = response as? HTTPURLResponse {
                if res.statusCode == 200 {
                    if let data = data, let body = try? JSONDecoder().decode(BabMenu.self, from: data) {
                        completion(body)
                    }
                }
            } else {
                print("Error")
            }
            
        }
        task.resume()
    }
}
