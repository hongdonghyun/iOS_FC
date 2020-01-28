//
//  Constants.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/20.
//  Copyright © 2020 hong3. All rights reserved.
//
import UIKit
import Foundation

let userDefault = UserDefaults.standard
let mainColor = UIColor(rgb: 0x5cc4c4)
//let mainColor = #colorLiteral(red: 0, green: 0.7938875556, blue: 0.7916871309, alpha: 1)

let placeHolderColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
let bankArray = ["국민", "신한", "우리", "하나", "기업", "농협", "산업", "수협", "새마을", "카카오", "씨티", "SC", "케이"].sorted()

let tossURL = URL(string: "https://toss.im/transfer-web/linkgen-api/link")!
let tossApiKey = "8ba40e1bf635494b8234f7ab727a2b3f"

let encoder = JSONEncoder()
let decoder = JSONDecoder()
