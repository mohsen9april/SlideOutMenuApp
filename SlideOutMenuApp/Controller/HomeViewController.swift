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
    }
    
    let menuController = MenuController()
    
    @objc func handleOpen(){
        
        menuController.view.frame = CGRect(x: 0, y: 0, width: 250, height: view.frame.height)
        let mainView = UIApplication.shared.keyWindow
        mainView?.addSubview(menuController.view)
        addChild(menuController)
    }
    
    @objc func handleHide(){
        
        menuController.view.removeFromSuperview()
        menuController.removeFromParent()
        
    }

    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))

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

