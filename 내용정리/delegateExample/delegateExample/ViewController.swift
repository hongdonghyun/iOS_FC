//
//  ViewController.swift
//  delegateExample
//
//  Created by Hongdonghyun on 2019/12/10.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.delegate = self
        myView.backgroundColor = .red
    }

}
extension ViewController: CustomViewDelegate {
    func colorBackground(_ newColor: UIColor?) -> UIColor{
        guard let color = newColor else { return .black }
        return color == .red ? .blue : color
    }
}
