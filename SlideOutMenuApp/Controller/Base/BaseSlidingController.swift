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
    
    @objc func handlePan(gesture : UIPanGestureRecognizer){
        let translation = gesture.translation(in: view)
        print(translation)
        var x = translation.x
        
        if isMenuOpen {
            x += menuWidth
        }
        
        x = min(menuWidth , x)
        x = max( 0 , x )
        redViewLeadingConstraint?.constant = x
        
        if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleEnded(gesture : UIPanGestureRecognizer){
        let translation = gesture.translation(in: view)
        if translation.x < menuWidth / 2 {
            redViewLeadingConstraint?.constant = 0
            isMenuOpen = false
        } else {
            redViewLeadingConstraint?.constant = menuWidth
            isMenuOpen = true
        }
        
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    var isMenuOpen = false
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
            blueView.trailingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingConstraint?.isActive = true
        
        
        let homeViewController = HomeViewController()
        let menuController = MenuController()
        let homeView = homeViewController.view!
        let menuView = menuController.view!
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        redView.addSubview(homeView)
        blueView.addSubview(menuView)
        addChild(homeViewController)
        addChild(menuController)
        NSLayoutConstraint.activate([
            
            homeView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 0),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 0),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 0),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 0),
            
            menuView.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 0),
            menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 0),
            menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: 0),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 0)

            ])
    }
}
