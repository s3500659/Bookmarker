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
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var isbn: UILabel!
    @IBOutlet weak var publisher: UILabel!
    
    @IBAction func startDateBtn(_ sender: Any) {
    }
    
    @IBAction func progressBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Update current page", message: "Enter current page number", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if let book = self.book {
                book.currentPage = (textField?.text! as! NSString).integerValue
                self.progress.text = "\(book.currentPage) of \(book.totalPages)"
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    

    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let book = book {
            // date text
            let formatter = DateFormatter()
            formatter.dateFormat = "dd mm yyyy"
            startDate.text = book.startDate == nil ? "not started" : String(formatter.string(from: book.startDate!))
            
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

