//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2019. 11. 20..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    let userDefault = UserDefaults.standard
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var alertSwitch: UISwitch!
    
    // MARK: Action Handler
    
    @IBAction func saveData(_ button: UIButton) {
        userDefault.set(datePicker.date, forKey: "saveDate")
        userDefault.set(alertSwitch.isOn, forKey: "switch")
    }
    
    @IBAction func loadData(_ button: UIButton) {
        if let dateX = userDefault.object(forKey: "saveDate") {
            datePicker.date = dateX as! Date
        } else {
            datePicker.date = Date()
        }
        alertSwitch.setOn(userDefault.bool(forKey: "switch"), animated: true)
        
    }
}

