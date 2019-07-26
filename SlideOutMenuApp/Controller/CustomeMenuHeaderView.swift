//
//  CustomeMenuHeaderView.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/26/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class CustomeMenuHeaderView: UIView {
    
    let nameLabel : UILabel = {
       let label = UILabel()
        label.text = "Mohsen Abdollahi"
        //label.backgroundColor = .green
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.text = "@Mohsen Abdollahi"
        //label.backgroundColor = .red
        return label
    }()
    
    let statsLabel : UILabel = {
        let label = UILabel()
        label.text = "42 Followinga  7091 Followers"
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        
        let stackView = UIStackView(arrangedSubviews: [UIView() ,nameLabel, usernameLabel, SpacerView(space: 16), statsLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
