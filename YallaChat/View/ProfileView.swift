//
//  ProfileView.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/30/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = cornerRadius
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
        
    }

}
