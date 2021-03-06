//
//  MainBranchCollectionViewCell.swift
//  babPlus
//
//  Created by YoujinMac on 2020/02/04.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import UIKit

class MainBranchCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainBranchCell"
    private let branchImage = UIImageView()
    private let branchName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //이미지 그림자
        contentView.backgroundColor = .clear
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 4
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.6
        
        branchImage.layer.cornerRadius = 8
        branchImage.layer.masksToBounds = true
        branchImage.contentMode = .scaleAspectFill
        
        branchName.textAlignment = .center
        branchName.font = UIFont.preferredFont(forTextStyle: .headline)
        branchName.textColor = .darkGray
        
    
    }
    
    private func setupConstraints() {
        let labelHeight:CGFloat = 20
        [branchImage, branchName].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            branchImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            branchImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            branchImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            branchImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -labelHeight),
            
            branchName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            branchName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            branchName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            branchName.heightAnchor.constraint(equalToConstant: labelHeight)
            
        ])
        
    }
    
    func configure(branchName name: String) {
        if let i = Constants.APPDELEGATE.storeImage.first(where: {
            $0.name == name
        }) {
            branchImage.image = i.image
        }
        
        branchName.text = name
    }
    
//    func configure(branchImageURL imageURL: String, branchName name: String) {
//        branchImage.image = (UIImage(named: "logo"))
//        guard let url = URL(string: imageURL) else { return }
//        let data = try! Data(contentsOf: url)
////        let image = UIImage(data: data)
////        if !imageURL.isEmpty, let url = URL(string: imageURL), let data = try? Data(contentsOf: url) {
////            branchImage.image = UIImage(data: data)
////        } else {
////            branchImage.image = (UIImage(named: "logo"))
////        }
//
//        branchName.text = name
//    }
    
}
