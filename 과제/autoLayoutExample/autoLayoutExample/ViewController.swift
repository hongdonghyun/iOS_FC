//
//  ViewController.swift
//  autoLayoutExample
//
//  Created by Hongdonghyun on 2019/12/12.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let redView = UIView()
    let blueView = UIView()
    
    let blackView = UIView()
    let greenView = UIView()
    let yellowView = UIView()
    let cyanView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        redView.backgroundColor = .systemRed
//        view.addSubview(redView)
//        blueView.backgroundColor = .systemIndigo
//        view.addSubview(blueView)
//        setUpViewAutoLayout()
        setUpViewAutoLayoutPractice()
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setUpViewFrame()
    }
    
    func setUpViewFrame() {
        let safeArea = view.safeAreaInsets
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let yOffset = safeArea.top + margin
        let safeAreaWidthOffset = safeArea.left + safeArea.right
        let viewWidth = (view.frame.width - padding - safeAreaWidthOffset) / 2 - margin
        let viewHeight = view.frame.height - yOffset - (safeArea.bottom + margin)
        
        redView.frame = CGRect(
            x: safeArea.left + margin,
            y: yOffset,
            width: viewWidth,
            height: viewHeight
        )
        blueView.frame = CGRect(x: redView.frame.maxX + padding, y: yOffset, width: redView.bounds.width, height: redView.bounds.height)
    }
    
    func setUpViewAutoLayout() {
        let layoutGuide = view.safeAreaLayoutGuide
        
        let margin: CGFloat = 20
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: margin).isActive = true
        redView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor,constant: -margin).isActive = true
        redView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor,constant: margin).isActive = true
        redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor,constant: -10).isActive = true
        
        redView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 1).isActive = true
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        blueView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: margin).isActive = true
        blueView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -margin).isActive = true
        blueView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -margin).isActive = true
        
    }
    
    private func autoSize(origin: UIView,target: UIView) {
        target.widthAnchor.constraint(equalTo: origin.widthAnchor, multiplier: 1).isActive = true
        target.heightAnchor.constraint(equalTo: origin.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setUpViewAutoLayoutPractice() {
        let views: [UIView: UIColor] = [blackView: .black, greenView: .green, yellowView: .systemYellow, cyanView: .cyan]
        let margin: CGFloat = 10
        let layoutGuide = view.safeAreaLayoutGuide
                
        for key in views.keys {
            key.backgroundColor = views[key]
            view.addSubview(key)
            key.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 좌상
        blackView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: margin).isActive = true
        blackView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: margin).isActive = true
        blackView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -margin).isActive = true
        
        //우상
        greenView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: margin).isActive = true
        greenView.leadingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: margin).isActive = true
        greenView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -margin).isActive = true
        greenView.bottomAnchor.constraint(equalTo: cyanView.topAnchor, constant: -margin).isActive = true
        
        //좌하
        yellowView.topAnchor.constraint(equalTo: blackView.bottomAnchor, constant: margin).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: margin).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -margin).isActive = true

        //우하
        cyanView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: margin).isActive = true
        cyanView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -margin).isActive = true
        cyanView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -margin).isActive = true
        
        autoSize(origin: blackView, target: greenView)
        autoSize(origin: blackView, target: yellowView)
        autoSize(origin: blackView, target: cyanView)
    }

}

