//
//  FriendCircleCell.swift
//  WeTalk
//
//  Created by 王泽宇 on 16/6/6.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit

class FriendCircleCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var postContentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userInteractionEnabled = false
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
