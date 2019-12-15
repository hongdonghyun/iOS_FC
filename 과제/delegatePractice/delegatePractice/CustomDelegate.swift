//
//  CustomDelegate.swift
//  delegatePractice
//
//  Created by Hongdonghyun on 2019/12/10.
//  Copyright © 2019 hong3. All rights reserved.
//

import Foundation


protocol CustomDelegateA: class {
    func sendText(_ data: String)
}

protocol CustomDelegateB: class {
    func sendText() -> String
}
