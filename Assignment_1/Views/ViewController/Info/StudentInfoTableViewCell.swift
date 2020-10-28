//
//  StudentInfoTableViewCell.swift
//  Assignment_1
//
//  Created by Vinh Tran on 25/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class StudentInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var studentLabel: UILabel!
    @IBOutlet weak var studentDescription: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
