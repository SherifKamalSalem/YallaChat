//
//  ChannelCellTableViewCell.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/30/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var channelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let name = channel.name ?? ""
        channelName.text = "#\(name)"
        
        channelName.font = UIFont(name: "AvenirNext-Regular", size: 19)
        for id in MessageService.instance.unreadChannels {
            if id == channel.id {
                channelName.font = UIFont(name: "AvenirNext-Bold", size: 19)
            }
        }
    }
}
