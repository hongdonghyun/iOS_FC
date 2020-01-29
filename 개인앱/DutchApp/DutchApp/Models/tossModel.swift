//
//  tossModel.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

struct TossRequest: Codable {
    let apiKey: String
    let bankName: String
    let bankAccountNo: String
    let amount: String
}

// Error handling 아직 정의안됨
extension TossRequest {
    func encode() -> Data? {
        guard let encodeData = try? encoder.encode(self) else { return nil }
        return encodeData
    }
}

// MARK: - Toss
struct Toss: Codable {
    let resultType: String
    let success: Success
}

// MARK: - Success
struct Success: Codable {
    let scheme: String
    let link: String
}
