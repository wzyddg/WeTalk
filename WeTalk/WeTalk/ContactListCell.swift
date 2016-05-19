//
//  ContactListCell.swift
//  WeTalk
//
//  Created by 王泽宇 on 16/5/18.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
