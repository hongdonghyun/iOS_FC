//
//  toss.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

struct SimpleToss {
    private let baseUrl = tossURL
    private let apiKey = tossApiKey
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func POSTrequest(bank: String, account: String, amount: String, completion: @escaping (Toss) -> ()) {
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = TossRequest(apiKey: self.apiKey, bankName: bank, bankAccountNo: account, amount: amount).encode()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                if let data = data, let res = try? self.decoder.decode(Toss.self, from: data) {
                    print(res)
                    completion(res)
                }
            } else {
                print(error ?? "Unknown error")
            }
        }

        task.resume()
    }
}
