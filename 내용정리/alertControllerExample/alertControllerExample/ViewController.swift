//
//  ViewController.swift
//  alertControllerExample
//
//  Created by Hongdonghyun on 2019/11/26.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(_ sender: Any) {
        let alertController = UIAlertController(title: "카운트 추가?", message:nil, preferredStyle: .alert)
        
        let alertAddCount = UIAlertAction(title: "Add Count",style: .default, handler: addCount(_:))
        let alertReset = UIAlertAction(title: "Reset",style: .destructive, handler: Reset(_:))
        let alertCancel = UIAlertAction(title: "Cancel",style: .cancel)
        
        alertController.addTextField {$0.placeholder = "정수 값을 입력하세요."}
        
        alertController.addAction(alertAddCount)
        alertController.addAction(alertReset)
        alertController.addAction(alertCancel)
        present(alertController,animated: true)
        
//        // alert controller
//        let alertController = UIAlertController(title: "타이틀", message: "메세지", preferredStyle: .actionSheet)
//
//        // alert action
//        let alertOK = UIAlertAction(title: "확인", style: .default, handler: alertReturn(_:))
//        let alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: alertReturn(_:))
//        let alertDel = UIAlertAction(title: "삭제", style: .destructive) { _ in print("삭제 trailing closure")}
//
//
//        // add alert action to alert controller
//        alertController.addAction(alertOK)
//        alertController.addAction(alertDel)
//        alertController.addAction(alertCancel)
//        present(alertController,animated: true)
    }
    
    func addCount(_ sender: UIAlertAction) {
        count += 1
        countLabel.text = String(count)
    }
    
    func Reset(_ sender: UIAlertAction) {
        count = 0
        countLabel.text = String(count)
    }
    
//    func alertReturn(_ sender: UIAlertAction) {
//        print(sender.title ?? "")
//    }
}

