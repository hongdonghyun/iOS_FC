//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    var isHolding = false
//    var lastTouchPoint = CGPoint.zero
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이미지 뷰 라운드
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named:"cat2")
            isHolding = true
//            lastTouchPoint = touchPoint
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard isHolding, let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
//        imageView.center.x += (touchPoint.x - lastTouchPoint.x)
//        imageView.center.y += (touchPoint.y - lastTouchPoint.y)
//        lastTouchPoint = touchPoint
        let prevTouchPoint = touch.previousLocation(in: touch.view)
            imageView.center.x += (touchPoint.x - prevTouchPoint.x)
            imageView.center.y += (touchPoint.y - prevTouchPoint.y)

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        imageView.image = UIImage(named:"cat1")
        isHolding = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        imageView.image = UIImage(named:"cat1")
        isHolding = false
    }
    
}



