//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 12. 17..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

struct Product {
    var img = UIImage()
    var description = ""
    var currentCount = 1
    var maxCount = 5
}

final class ItemCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var productMaxCount = 0
    
    var delegate: ViewControllerDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        delegate?.addOrder(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}

extension ItemCell {
    func config(productImage: UIImage?, productContent: String?, maxCount: Int) {
        productImageView.image = productImage
        productLabel.text  = productContent
        productMaxCount = maxCount
    }
}
