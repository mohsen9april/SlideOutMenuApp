//
//  ListViewController.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/30/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    let label : UILabel = {
        let lbl = UILabel()
        lbl.text = "List"
        lbl.font = UIFont.systemFont(ofSize: 64)
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(label)
        //label.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        label.frame = view.frame
        label.textAlignment = .center

    }
}
