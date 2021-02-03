//
//  DetailCollectionViewCell.swift
//  forum
//
//  Created by Derek Samson on 03/02/2021.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    let myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myLabel)
        myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        myLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        myLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
