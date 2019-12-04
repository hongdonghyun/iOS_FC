//
//  SecondViewController.swift
//  StoryBoardSegueExample
//
//  Created by Hongdonghyun on 2019/12/03.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var label: UILabel!
    var secondLabelText = ""
    var count = 0
    var tfText = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = secondLabelText
        TextField.keyboardType = .numberPad
        TextField.addTarget(self, action: #selector(editingDidEnd(_:)), for: .editingDidEndOnExit)
        
    }

    @objc func editingDidEnd(_ sender: UITextField) {
        guard let numbers = Int(sender.text ?? "0") else { return }
        tfText = numbers
    }
    
    @IBAction func unwindToThirdToSecond(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
    }
}
