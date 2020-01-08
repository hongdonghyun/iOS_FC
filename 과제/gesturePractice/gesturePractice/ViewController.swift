//
//  ViewController.swift
//  gesturePractice
//
//  Created by Hongdonghyun on 2020/01/07.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let countLabel = UILabel()
    
    private let coordinateLabel = UILabel()
    private var lastCoordinate = CGPoint()
    
    private let currentModeLabel = UILabel()
    private let modeChangeBtn: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private var clickCount = 0
    private var modeIndex = 0
    private let modeArray = ["touchesBegan", "TapGesture", "GestureRecognizerDelegate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpTapGesture()
        setUpDelegate()
    }


}

// MARK: - Delegate
extension ViewController {
    private func setUpDelegate() {
        let gestureDelegate = UITapGestureRecognizer()
        gestureDelegate.delegate = self
        view.addGestureRecognizer(gestureDelegate)
    }
}

// MARK: - Touches
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard modeIndex == 0, let touch = touches.first else { return }
        super.touchesBegan(touches, with: event)
        let touchPoint = touch.location(in: touch.view)
        calculateClick(origin: touchPoint)
    }
    
    
}

// MARK: - TapGesture
extension ViewController {
    private func setUpTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tapGesture(_ sender: UITapGestureRecognizer) {
        guard modeIndex == 1, sender.state == .ended else { return }
        let touchPoint = sender.location(in: self.view)
        calculateClick(origin: touchPoint)
        
        
    }
}

// MARK: - UI
extension ViewController {
    private func setUpUI() {
        let layoutGuide = view.safeAreaLayoutGuide
        let labels = [countLabel, coordinateLabel, currentModeLabel, modeChangeBtn]
        labels.forEach { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(label)
        }
        
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 40),
            countLabel.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 40),
            countLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -10),

            coordinateLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 40),
            coordinateLabel.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 40),
            coordinateLabel.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -10),
            
            currentModeLabel.topAnchor.constraint(equalTo: coordinateLabel.bottomAnchor, constant: 40),
            currentModeLabel.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 40),
            currentModeLabel.widthAnchor.constraint(equalToConstant: 250),
            
            modeChangeBtn.topAnchor.constraint(equalTo: currentModeLabel.topAnchor, constant: -5),
            modeChangeBtn.leadingAnchor.constraint(equalTo: currentModeLabel.trailingAnchor, constant: 50),
            
        ])
        modeChangeBtn.addTarget(self, action: #selector(didTapModeChangeBtn(_:)), for: .touchUpInside)
        
        setCountLabelText(clickCount)
        setCoordinateText(CGPoint())
        displayCurrentMode(modeIndex)
    }
    
    private func setCountLabelText(_ count: Int) {
        countLabel.text = "횟수 : \(count)"
    }
    
    private func setCoordinateText(_ coordinate: CGPoint) {
        let pointX = String(format: "%0.1f", coordinate.x)
        let pointY = String(format: "%0.1f", coordinate.y)
        coordinateLabel.text = "좌표 : (\(pointX), \(pointY))"
    }
    
    private func displayCurrentMode(_ index: Int) {
        currentModeLabel.text = modeArray[index]
        modeChangeBtn.setTitle(" \(index+1)번 ", for: .normal)
    }
    
    @objc private func didTapModeChangeBtn(_ sender: UIButton) {
        guard 0...2 ~= modeIndex else { return }
        switch modeIndex {
        case 0:
            modeIndex = 1
        case 1:
            modeIndex = 2
        case 2:
            modeIndex = 0
        default:
            print("Error")
        }
        displayCurrentMode(modeIndex)
    }
}

// MARK: - Calculate
extension ViewController {
    private func calculateDistance(beforeTouch origin: CGPoint, afterTouch destination: CGPoint) -> CGFloat {
        let absX = abs(origin.x - destination.x)
        let absY = abs(origin.y - destination.y)
        let distanceX = pow(absX,2)
        let distanceY = pow(absY,2)
        return (distanceX + distanceY).squareRoot()
    }
    
    private func calculateClick(origin: CGPoint) {
        if calculateDistance(beforeTouch: lastCoordinate, afterTouch: origin) < 10 {
            clickCount += 1
        } else {
            clickCount = 1
        }
        setCountLabelText(clickCount)
        lastCoordinate = origin
        setCoordinateText(origin)
    }
}

// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard modeIndex == 2 else { return false }
        let touchPoint = touch.location(in: self.view)
        calculateClick(origin: touchPoint)
        return true
    }
}
