//
//  SecondViewController.swift
//  DogBirdCat
//
//  Created by Hongdonghyun on 2019/12/03.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var IncreaseAll: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    var currentCnt: [Animal: Int] = [:]
    var currentImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = currentImg
        IncreaseAll.addTarget(self, action: #selector(increaseCnt(_:)), for: .touchUpInside)
        
    }
    
    @objc func increaseCnt(_ sender: UIButton) {
        guard let vc = presentingViewController as? FirstViewController else { return }
        
        for i in currentCnt {
            currentCnt[i.key] = i.value + 1
        }
        
        vc.buttonDict = currentCnt
        vc.countLabel.text = "\(self.currentCnt[.Dog]!),\(self.currentCnt[.Cat]!),\(self.currentCnt[.Bird]!)"
        dismiss(animated: true)
    }
    
}
