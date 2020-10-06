//
//  BookViewController.swift
//  Assignment_1
//
//  Created by Vinh Tran on 7/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var startDateUpdateBtn: UIButton!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var progressUpdateBtn: UIButton!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var isbn: UILabel!
    @IBOutlet weak var publisher: UILabel!
    

    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let book = book {
            // date text
            
            // date button
            
            // progress text
            progress.text = "\(book.currentPage) of \(book.totalPages)"
            // progress button
            
            // book description
            bookDescription.text = book.description
            notes.text = book.notes
            isbn.text = book.isbn
            publisher.text = book.publisher
        }
     

    }


}

