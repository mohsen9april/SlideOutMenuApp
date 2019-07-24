//
//  ViewController.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/24/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        setupNavigationItems()
        setupMenuController()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)

    }
    
    @objc func handlePan(gesture : UIPanGestureRecognizer){
        let translation = gesture.translation(in: view)
        
        if gesture.state == .changed {
            var x = translation.x
            if isMenuOpened {
                x += menuWidth
            }
            x = min(menuWidth , x)
            x = max( 0 , x )
            menuController.view.transform = CGAffineTransform(translationX: x, y: 0 )
            self.navigationController?.view.transform = CGAffineTransform(translationX: x, y: 0)
            
        } else if gesture.state == .ended {
            handleEnded(gesture : gesture)
        }
    }
    
    fileprivate func handleEnded(gesture : UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpened {
            // this Section is Related to Close Menu
            if abs(velocity.x) > 500 {
                handleHide()
            }
            if abs(translation.x) < menuWidth / 2 {
                handleOpen()
            } else {
                handleHide()
            }
        } else {
            // this Section is Related to Open Menu
            if velocity.x > 500 {
                handleOpen()
                return
            }
            if translation.x < menuWidth / 2 {
                handleHide()
            } else {
                handleOpen()
            }
        }
    }
    
    let menuController = MenuController()
    fileprivate var menuWidth : CGFloat = 300
    fileprivate var isMenuOpened = false
    
    @objc func handleOpen(){
        isMenuOpened = true
        UIView.animate(withDuration: 0.9 , delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            //Final Position to Animate MenuController
            self.menuController.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0 )
            self.navigationController?.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0)
 
        }, completion: nil)
    }
    
    @objc func handleHide(){
        isMenuOpened = false
        UIView.animate(withDuration: 0.9 , delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            //Final Position to Animate MenuController
            self.menuController.view.transform = .identity
            self.navigationController?.view.transform = .identity
            
        }, completion: nil)
    }

    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    fileprivate func setupMenuController() {
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth , height: view.frame.height)
        let mainView = UIApplication.shared.keyWindow
        mainView?.addSubview(menuController.view)
        addChild(menuController)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Row\(indexPath.row)"
        return cell
    }
}

