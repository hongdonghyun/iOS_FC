//
//  ViewController.swift
//  DogBirdCat
//
//  Created by Hongdonghyun on 2019/12/03.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var buttonDict = ["Dog":0,"Cat":0,"Bird":0]
    
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showCountLabel()
    }
    
    private func showCountLabel() {
        countLabel.text = "\(self.buttonDict["Dog"]!),\(self.buttonDict["Cat"]!),\(self.buttonDict["Bird"]!)"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "Dog" && buttonDict[identifier]! + 1 >= 8 {
            return false
        } else if identifier == "Cat" && buttonDict[identifier]! + 1 >= 10 {
            return false
        } else if identifier == "Cat" && buttonDict[identifier]! + 1 >= 15 {
            return false
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondViewController = segue.destination as? SecondViewController else { return }
        guard let identifier = segue.identifier else { return }
        
        super.prepare(for: segue, sender: sender)
        
        let imgStr: String
        
        switch identifier {
        case "Dog":
            buttonDict[identifier] = buttonDict[identifier]! + 1
            imgStr = "개"
        case "Cat":
            imgStr = "구름이"
            buttonDict[identifier] = buttonDict[identifier]! + 1
        case "Bird":
            imgStr = "토끼"
            buttonDict[identifier] = buttonDict[identifier]! + 1
        default:
            imgStr = "개"
        }
        if let temp = UIImage(named: imgStr) {
            secondViewController.currentImg = temp
            secondViewController.currentCnt = buttonDict
        }
        
    }
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        guard let origin = unwindSegue.source as? SecondViewController else { return }
        buttonDict = origin.currentCnt
        showCountLabel()
    }
    
}

