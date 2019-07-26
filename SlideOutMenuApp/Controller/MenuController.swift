//
//  MenuController.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/24/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

struct MenuItem {
    var icon : UIImage
    var title : String
}

class MenuController: UITableViewController {

    var menuItems = [MenuItem(icon: #imageLiteral(resourceName: "profile"), title: " Profile"),
                     MenuItem(icon: #imageLiteral(resourceName: "lists"), title: " List"),
                     MenuItem(icon: #imageLiteral(resourceName: "profile"), title: " Bookmark"),
                     MenuItem(icon: #imageLiteral(resourceName: "moments"), title: " Moment"),
                     ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: "CellId")
        tableView.separatorStyle = .none

    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customeMenuHeaderView = CustomeMenuHeaderView()
        return customeMenuHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! MenuItemCell
        cell.titleLabel.text = menuItems[indexPath.row].title
        cell.iconImageView.image = menuItems[indexPath.row].icon
        return cell
    }
}
