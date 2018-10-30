//
//  CircularImage.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/29/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

@IBDesignable
class CircularImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
