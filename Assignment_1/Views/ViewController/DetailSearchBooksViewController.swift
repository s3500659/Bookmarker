//
//  DetailSearchBooksViewController.swift
//  Assignment_1
//
//  Created by Philip Beeby on 1/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class DetailSearchBooksViewController: UIViewController {

    var selectedBook: (title: String, author: String, image: UIImage?)?

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedBook = selectedBook {
            bookImage.image = selectedBook.image
            bookTitle.text = selectedBook.title
            bookAuthor.text = selectedBook.author

        }
    }
}
