//
//  SpacerView.swift
//  SlideOutMenuApp
//
//  Created by Mohsen Abdollahi on 7/26/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class SpacerView: UIView {
    
    var space : CGFloat

    override var intrinsicContentSize: CGSize {
        return .init(width: space , height: space)
    }
    
    init(space : CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
