//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class GestureViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    var isQuadruple = false
    var initialCenter = CGPoint()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        
    }
    
    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        print(sender.rotation)
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction func handelTapGesture(_ sender: UITapGestureRecognizer) {
        // 상태확인
        guard sender.state == .ended else { return }
        if !isQuadruple {
            // 확대
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        } else {
            // 최초값
            imageView.transform = CGAffineTransform.identity
        }
        isQuadruple.toggle()
    }
    
    @IBAction func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        guard sender.state == .ended else { return }
        switch sender.direction {
        case .left:
            imageView.image = UIImage(named: "cat1")
        case .right:
            imageView.image = UIImage(named: "cat2")
        default:
            print("Error")
        }
        
    }
    
    // 이미지뷰에 설정됨
    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        guard let dragView = sender.view else { return }
        let translation = sender.translation(in: dragView)
//        코드로
//        dragView.isUserInteractionEnabled = true
        if sender.state == .began {
            initialCenter = dragView.center
        }
        
        if sender.state != .cancelled {
            dragView.center = CGPoint(x: initialCenter.x - translation.x,
                                      y: initialCenter.y - translation.y)
        } else {
            dragView.center = initialCenter
        }
        
        
    }
    
    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
}
