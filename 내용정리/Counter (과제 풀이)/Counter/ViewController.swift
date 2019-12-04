//
//  ViewController.swift
//  Counter
//
//  Created by Giftbot on 2019/11/25.
//  Copyright © 2019 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  let countLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    countLabel.text = "0"
    countLabel.font = .preferredFont(forTextStyle: .title2)
    countLabel.frame = CGRect(x: 0, y: 150, width: 100, height: 40)
    countLabel.center.x = view.center.x
    countLabel.textAlignment = .center
    view.addSubview(countLabel)
    
    let button = UIButton(type: .system)
    button.setTitle("Present", for: .normal)
    button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
    button.sizeToFit()
    button.center = view.center
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    view.addSubview(button)
  }
  
  
  @objc private func didTapButton(_ sender: Any) {
    guard let count = Int(countLabel.text ?? "") else { return }
    
    let bVC = BViewController()
    bVC.countLabel.text = String(count + 1)
    
//    bVC.modalPresentationStyle = .fullScreen
    bVC.presentationController?.delegate = self
    present(bVC, animated: true)
  }
}


// MARK: - UIAdaptivePresentationControllerDelegate

extension ViewController: UIAdaptivePresentationControllerDelegate {
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    guard let bVC = presentationController.presentedViewController as? BViewController,
      let currentCount = Int(bVC.countLabel.text ?? "0")
      else { return }
    
    countLabel.text = String(currentCount + 1)
  }
}
