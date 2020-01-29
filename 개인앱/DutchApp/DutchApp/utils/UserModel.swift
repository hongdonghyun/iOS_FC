//
//  UserModel.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

struct ItemData: Codable {
    var saveDate: String
    var itemName: String
    var totalPrice: String
    var totalPerson: String
    var priceN: String
    var accountInfo: AccountData?
}

extension ItemData {
    func encode() -> Data? {
        guard let encodeData = try? encoder.encode(self) else { return nil }
        return encodeData
    }
    
    func decode(rawData : Data) -> ItemData? {
        guard let decodeData = try? decoder.decode(ItemData.self, from: rawData) else { return nil }
        return decodeData
        
    }
}

struct AccountData: Codable {
    var accountHolder: String
    var selectedBank: String
    var accountNumber: String
}
