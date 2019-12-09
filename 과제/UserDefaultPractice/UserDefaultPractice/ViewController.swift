//
//  ViewController.swift
//  UserDefaultPractice
//
//  Created by Hongdonghyun on 2019/12/06.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var imgShowSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage(isOn: UserDefaults.standard.bool(forKey: "toggle"))
    }
    
    private func showImage(isOn: Bool) {
       if let img = isOn ? UIImage(named: "cat") : UIImage(named: "dog") {
            imageView.image = img
            animalLabel.text = isOn ? "cat" : "dog"
            imgShowSwitch.setOn(isOn, animated: true)
            setUserdefault(toggleValue: isOn)
        }
    }
    
    @IBAction func toggle(_ sender: UISwitch) {
        let isOn = sender.isOn
        showImage(isOn: isOn)
    }
    
    private func setUserdefault(toggleValue: Bool) {
        UserDefaults.standard.set(toggleValue,forKey: "toggle")
        UserDefaults.standard.synchronize() 
        print("--------마지막 저장 값----------")
        
        print(UserDefaults.standard.bool(forKey: "toggle"))
    }
    

}

