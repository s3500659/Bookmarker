//
//  BookViewController.swift
//  Assignment_1
//
//  Created by Vinh Tran on 7/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if let book = book {
            titleLabel.text = book.getTitle()
            authorLabel.text = book.getAuthor()
            photoImageView.image = book.getPhoto()
        }
    }


}

