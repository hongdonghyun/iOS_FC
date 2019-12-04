//
//  FirstViewController.swift
//  StoryBoardSegueExample
//
//  Created by Hongdonghyun on 2019/12/03.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    var firstLabelText = ""
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLabel.text = firstLabelText
    }
    // ActionSegue: ShouldPerform -> Prepare
    // ManualSegue: PerfromSegue -> Prepare
    // prepare 이전에 호출
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        var plus = 10
        if identifier == "one" {
            plus = 1
        } else if identifier == "five" {
            plus = 5
        }
        return count + plus <= 40
    }
    
    // 스토리 보드에서 segue를 통해 넘어갈 때, 화면전환 과정에서 특정한 작업을 할 수 있도록 사용하는 메서드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        segue.destination // 목적지 Second
//        segue.source // 출발지 First
//        segue.identifier // 고유값
        guard let secondVC = segue.destination as? SecondViewController else { return }
        
        if segue.identifier == "one" {
            count += 1
            secondVC.secondLabelText = "\(count)"
        } else if segue.identifier == "five" {
            count += 5
            secondVC.secondLabelText = "\(count)"
        } else {
            count += 10
            secondVC.secondLabelText = "\(count)"
        }
        secondVC.count = count
    }
    
    @IBAction func didTapFive(_ sender: Any) {
        performSegue(withIdentifier: "five", sender: sender)
    }
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        guard let secondVC = unwindSegue.source as? SecondViewController else { return }
        count -= secondVC.tfText
        
    }
    
    @IBAction func unwindToThirdToFirst(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}




