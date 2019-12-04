//
//  ViewController.swift
//  Frame,Bounds
//
//  Created by Hongdonghyun on 2019/11/27.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        if #available(iOS 13.0, *) {
            redView.backgroundColor = .systemRed
            greenView.backgroundColor = .systemGreen
        } else {
            redView.backgroundColor = .red
            greenView.backgroundColor = .green
        }
        
        greenView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        view.addSubview(redView)
        redView.addSubview(greenView)
        print("-----바꾸기 전-----")
        print("redView frame x,y좌표: ",redView.frame.origin.x,",",redView.frame.origin.y)
        print("redView bounds x,y좌표: ",redView.bounds.origin.x,",",redView.bounds.origin.y)
        print("greenView frame x,y좌표: ",greenView.frame.origin.x,",",greenView.frame.origin.y)
        print("greenView bounds x,y좌표: ",greenView.bounds.origin.x,",",greenView.bounds.origin.y)
//        UIViewPropertyAnimator(duration: 5, curve: .easeOut) {
//            self.redView.bounds.origin = CGPoint(x: -50, y: -50)
//        }.startAnimation()
//        print("-----바꾼 후-----")
//        print("redView frame x,y좌표: ",redView.frame.origin.x,",",redView.frame.origin.y)
//        print("redView bounds x,y좌표: ",redView.bounds.origin.x,",",redView.bounds.origin.y)
//        print("greenView frame x,y좌표: ",greenView.frame.origin.x,",",greenView.frame.origin.y)
//        print("greenView bounds x,y좌표: ",greenView.bounds.origin.x,",",greenView.bounds.origin.y)
    

    }


}

