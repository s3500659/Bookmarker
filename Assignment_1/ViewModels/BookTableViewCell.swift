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

    // This will be a concatentation of currentPages and totalPages
    // so it reads 'Page 10 of 100'
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    // This will be a % of the book completed like 'currentPages' / 'totalPages' * 100
    @IBOutlet weak var completedProgressView: UIProgressView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
