//
//  AvatarCollectionViewCell.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/29/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == .dark {
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}
