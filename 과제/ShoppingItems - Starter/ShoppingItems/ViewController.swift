//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 12. 17..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit


protocol ViewControllerDelegate {
    func addOrder(_ cell:ItemCell)
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    var imageArray: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in ["iPhone8", "iPhoneSE_Gold", "iPhoneSE_RoseGold","iPhoneX_SpaceGray", "iPhoneX_White","bokgil", "chapssal", "cloud","cloud2", "cloud3", "dog","firecracker","lineage", "rabbit","squid"]
        {
            imageArray.append(
                Product(
                    img: UIImage(named: i)!,
                    description: i
                )
            )
        }
    }
    
    private func alertAction() -> UIAlertController {
        let alert = UIAlertController(title: "주문 수량 초과", message: "주문 수량을 초과했습니다.", preferredStyle: UIAlertController.Style.alert)
        let alertOK = UIAlertAction(title: "확인", style: .default)
        alert.addAction(alertOK)
        return alert
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell, imageArray.count > indexPath.row else { return UITableViewCell() }
        
        cell.delegate = self
        cell.config(
            productImage: imageArray[indexPath.row].img,
            productContent: imageArray[indexPath.row].description,
            maxCount: imageArray[indexPath.row].maxCount
        )
        return cell
    }
}

extension ViewController: ViewControllerDelegate {
    func addOrder(_ cell: ItemCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        
        if imageArray[index.row].currentCount < 5 {
            imageArray[index.row].currentCount += 1
        } else {
            present(alertAction(), animated: false, completion: nil)
            UIView.animate(withDuration: 0.4) {
                cell.backgroundColor = .red
                cell.alpha = 0.6
            }
            UIView.animate(withDuration: 0.4,delay: 0.4, animations: {
                cell.backgroundColor = .systemBackground
                cell.alpha = 1
            })
            
        }
        cell.countLabel.text = "\(imageArray[index.row].currentCount)"
    }
    
}
