//
//  BookViewController.swift
//  Assignment_1
//
//  Created by Vinh Tran on 7/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    let bookManager = BookManager.shared
    
    var book: Book?

    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var isbn: UILabel!
    @IBOutlet weak var publisher: UILabel!

    private var toolBar = UIToolbar()
    private var datePicker = UIDatePicker()


    // issue: if you click done without using the date picker, then the dateChanged func won't execute and date label won't update.
    @IBAction func startDateBtn(_ sender: Any) {
        // ref for date picker: https://stackoverflow.com/questions/46074242/date-picker-on-a-button-click-in-ios/46074735
        showDatePicker(sender as! UIButton)
    }

    @IBAction func showDatePicker(_ sender: UIButton) {
        datePicker = UIDatePicker.init()
        datePicker.backgroundColor = UIColor.white
        datePicker.autoresizingMask = .flexibleWidth
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(datePicker)
        toolBar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .blackTranslucent
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        toolBar.sizeToFit()
        self.view.addSubview(toolBar)
    }

    @objc func dateChanged(_ sender: UIDatePicker?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        if let date = sender?.date {
            let (updatedBook, error) = bookManager.updateStartDate(book: book!, date: date)
            if updatedBook {
                startDate.text = dateFormatter.string(from: date)
            }
            else {
                showError(error: error)
            }
        }
    }

    @objc func onDoneButtonClick() {
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }

    @IBAction func progressBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Update current page", message: "Enter current page number", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let pageInput = textField!.text
            
            let (updatedBook, error) = self.bookManager.updatePage(book: self.book!, page: Int32(pageInput!) ?? 0)
            if updatedBook {
                self.progress.text = "\(self.book?.currentPage ?? 0) of \(self.book?.totalPages ?? 0)"
            }
            else {
                self.showError(error: error)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func textViewDidChange(_ textView: UITextView) {
        let (updatedBook, error) = bookManager.updateNotes(book: book!, notes: textView.text)
        if !updatedBook {
            showError(error: error)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if notes.textColor == UIColor.lightGray {
            notes.text = nil
            notes.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if notes.text == nil {
            notes.textColor = UIColor.lightGray
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        notes.delegate = self
        if let book = book {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            startDate.text = book.startDate == nil ? "Not started" : String(formatter.string(from: book.startDate!))
            progress.text = "\(book.currentPage) of \(book.totalPages)"
            bookDescription.text = book.desc
            
            if (book.notes == "" || book.notes == nil) {
                notes.textColor = UIColor.lightGray
            }
            else {
                notes.text = book.notes
            }
            
            isbn.text = book.isbn
            publisher.text = book.publisher
            self.progress.accessibilityIdentifier = "progress-label"
        }
    }
    
    // MARK: Private funcs
    
    private func showError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
