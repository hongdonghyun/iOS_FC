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
//    private let branchImage = UIImageView().image = UIImage(named: "babPlusLogo")

    private let branchName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUPViews()
        setUPConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUPViews() {

        //이미지 그림자
        contentView.backgroundColor = .clear
        
        layer.cornerRadius = 10
//        layer.shadowColor = .init(srgbRed: 140, green: 140, blue: 140, alpha: 0.5)
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 3              //그림자 크기
        layer.shadowOffset = .zero          //위치 어느쪽으로 쏠릴지
        layer.shadowOpacity = 0.5           //알파값 같은??
        branchImage.layer.cornerRadius = 8
        branchImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //이미지 라운드
//        self.clipsToBounds = true
//        branchImage.layer.cornerRadius = 8
        
        branchImage.layer.masksToBounds = true
        
        branchImage.contentMode = .scaleAspectFill
        contentView.addSubview(branchImage)
        
        branchName.textAlignment = .center
        branchName.font = UIFont.preferredFont(forTextStyle: .headline)
        
        branchName.textColor = .darkGray
        contentView.addSubview(branchName)
    
    }
    
    private func setUPConstraints() {
        [branchImage, branchName].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let labelHeight:CGFloat = 20
        
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
    
    func configure(branchImageURL imageURL: String, branchName name: String) {
        if imageURL == "" {
            branchImage.image = (UIImage(named: "logo"))
        } else {
            guard let url = URL(string: imageURL) else {
                branchImage.image = (UIImage(named: "logo"))
                return
            }
            let data = try! Data(contentsOf: url)
            branchImage.image = UIImage(data: data)
        }
        
        branchName.text = name
    }
    
}
