//
//  SendCell.swift
//  WeTalk
//
//  Created by 王泽宇 on 16/6/4.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit

class SendCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var boundaryView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        boundaryView.layer.cornerRadius = 5
        self.userInteractionEnabled = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
