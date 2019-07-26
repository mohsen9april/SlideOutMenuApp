//
//  BaseSlidingController.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/26/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class BaseSlidingController: UIViewController {
    
    let redView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let blueView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupViews()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)

    }
    
    @objc func handlePan(gestrue : UIPanGestureRecognizer){
        let translation = gestrue.translation(in: view)
        print(translation)
        var x = translation.x
        x = min(menuWidth , x)
        redViewLeadingConstraint?.constant = x
    }
    
    var redViewLeadingConstraint : NSLayoutConstraint?
    let menuWidth: CGFloat = 300
    
    fileprivate func setupViews() {
        view.addSubview(redView)
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 0),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint?.isActive = true
        
        
        let homeViewController = HomeViewController()
        let homeView = homeViewController.view!
        redView.addSubview(homeView)
        addChild(homeViewController)
        NSLayoutConstraint.activate([
           homeView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 0),
           homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 0),
           homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 0),
           homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 0)
            ])

    }
}
