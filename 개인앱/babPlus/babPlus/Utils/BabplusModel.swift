//
//  BabplusModel.swift
//  babPlus
//
//  Created by Hongdonghyun on 2020/02/05.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import Foundation

// MARK: - BabMenu
struct BabMenu: Decodable {        
    let date: String
    let contents: [String: Content]
}

struct Content: Codable {
    let image: String?
    let address: String
    let menus: Menus
}

// MARK: - Menu
struct Menus: Codable {
    let lunch, dinner: [String]
}
