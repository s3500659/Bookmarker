//
//  BookTableViewCell.swift
//  Assignment_1
//
//  Created by Jordan Watson on 22/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    // MARK: properties

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var completedProgressView: UIProgressView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
