//
//  CustomeMenuHeaderView.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/26/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class CustomeMenuHeaderView: UIView {
    
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let statsLabel = UILabel()
    let profileImageView = ProfileImageView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
        setupHeaderComponent()
        
    }
    
    fileprivate func setupStackView() {
        
        let rightSpace = UIView()
        let stackView = UIStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [profileImageView , rightSpace]),
            UIView(),
            nameLabel,
            usernameLabel,
            SpacerView(space: 8),
            statsLabel])
        
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
    
    fileprivate func setupHeaderComponent() {
        profileImageView.image = #imageLiteral(resourceName: "golshifteh")
        profileImageView.layer.cornerRadius =  48 / 2
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        nameLabel.text = "Golshifteh Farahani"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        usernameLabel.text = "@Golshifteh"
        //statsLabel.text = "42 Followinga  7091 Followers"
        setupStatasLabelAttributedText()
    }
    
    fileprivate func setupStatasLabelAttributedText(){
        statsLabel.font = UIFont.systemFont(ofSize: 14)
        let attributedText = NSMutableAttributedString(string: "42", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium)])
        attributedText.append(NSAttributedString(string: " Followinga", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))
        attributedText.append(NSAttributedString(string: " 7091", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium)]))
        attributedText.append(NSAttributedString(string: " Followers", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))
        statsLabel.attributedText = attributedText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
