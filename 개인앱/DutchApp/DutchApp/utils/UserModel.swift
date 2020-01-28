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
    var reportingDate: String
    var accountInfo: AccountData
}

struct AccountData: Codable {
    var accountHolder: String
    var selectedBank: String
    var accountNumber: String
}
