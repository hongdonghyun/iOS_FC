//
//  ViewController.swift
//  DogBirdCat
//
//  Created by Hongdonghyun on 2019/12/03.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    var buttonDict: [Animal: Int] = [
        .Dog: 0,
        .Cat: 0,
        .Bird: 0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCountLabel()
    }
    
    private func showCountLabel() {
        countLabel.text = "\(self.buttonDict[.Dog]!),\(self.buttonDict[.Cat]!),\(self.buttonDict[.Bird]!)"
    }
    
    private func animalMaxTapCheck(animal: Animal,max: Int) -> Bool {
        guard let value = buttonDict[animal] else { return false }
        return value + 1 >= max ? true : false
        
    }
    
    private func didTapIncrease(animal: Animal) -> String {
        buttonDict[animal] = buttonDict[animal]! + 1
        
        switch animal {
        case .Dog:
            return "개"
        case .Cat:
            return "구름이"
        case .Bird:
            return "토끼"
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let imgType = Animal(rawValue: identifier) else { return false }
        
        switch imgType {
        case .Dog where animalMaxTapCheck(animal: imgType, max: 8):
            return false
        case .Cat where animalMaxTapCheck(animal: imgType, max: 10):
            return false
        case .Bird where animalMaxTapCheck(animal: imgType, max: 15):
            return false
        default:
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondViewController = segue.destination as? SecondViewController else { return }
        guard let identifier = segue.identifier, let imgType = Animal(rawValue: identifier) else { return }
        
        super.prepare(for: segue, sender: sender)
        
        if let temp = UIImage(named: didTapIncrease(animal: imgType)) {
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

