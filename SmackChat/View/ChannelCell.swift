//
//  ChannelCell.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 10/11/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var channelNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel : Channel) {
        let title = channel.channelTitle ?? ""
        channelNameLabel.text = title
    }
}
