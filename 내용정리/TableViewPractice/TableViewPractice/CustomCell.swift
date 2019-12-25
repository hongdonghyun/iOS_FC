//
//  CustomCell.swift
//  TableViewPractice
//
//  Created by Hongdonghyun on 2019/12/24.
//  Copyright © 2019 hong3. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    var delegate: FirstViewDelegate?
    
    @IBAction func buttonAction(_ sender: UIButton) {
        delegate?.loadNewScreen(cell: self)
    }
}

extension CustomCell {
    
    func config(image: UIImage?, text: String) {
        myImage.image = image
        myLabel.text = text
    }
}
