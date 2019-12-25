//
//  DetailViewController.swift
//  TableViewPractice
//
//  Created by Hongdonghyun on 2019/12/24.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailImageView: UIImageView!
    var detailText = ""
    var detailImg = UIImage()

    @IBOutlet weak var countLabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        countLabel.text = "\(count)"
        title = detailText
        detailImageView?.image = detailImg
        
    }
    
    @IBAction func plusBtnAction(_ sender: Any) {
    }

    @IBAction func subtractBtnAction(_ sender: Any) {
    }
}
