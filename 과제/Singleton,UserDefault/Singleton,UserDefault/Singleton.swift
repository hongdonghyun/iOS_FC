//
//  Singleton.swift
//  Singleton,UserDefault
//
//  Created by Hongdonghyun on 2019/12/06.
//  Copyright © 2019 hong3. All rights reserved.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    var text: String = ""
    
    private init() {}
}
