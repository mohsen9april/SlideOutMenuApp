//
//  MenuController.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/24/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")

    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customeMenuHeaderView = CustomeMenuHeaderView()
        //purpleView.backgroundColor = .purple
        return customeMenuHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "Menu Item Row\(indexPath.row)"
        return cell
    }
}
