//
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ImageAnimationViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var repeatCountLabel: UILabel!
    
    let images = [
        "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
        ].compactMap(UIImage.init(named:))
    //    let images = [
    //       "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
    //       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.animationImages = images
    }
    
    @IBAction private func startAnimation(_ sender: Any) {
        imageView.startAnimating()
    }
    
    @IBAction private func stopAnimation(_ sender: Any) {
        guard imageView.isAnimating else { return }
        imageView.stopAnimating()
    }
    
    @IBAction private func durationStepper(_ sender: UIStepper) {
        durationLabel.text = "\(sender.value)"
        imageView.animationDuration = sender.value
        //default 0 -> 1/30
    }
    
    @IBAction private func repeatCountStepper(_ sender: UIStepper) {
        let repeatCount = Int(sender.value)
        repeatCountLabel.text = "\(repeatCount)"
        imageView.animationRepeatCount = repeatCount
        // default 0 - 무한반복
    }
}
