//
//  ProfileViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookManager.favouriteCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteBookCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let progress = cell.viewWithTag(1002) as! UILabel
        let progressView = cell.viewWithTag(1003) as! UIProgressView
        let bookImage = cell.viewWithTag(1004) as! UIImageView
        let book = bookManager.getFavourite(index: indexPath.row)
        let currentProgress: Float = Float(book.currentPage) / Float(book.totalPages)
        title.text = book.title
        author.text = book.author
        progress.text = "Page \(book.currentPage) of \(book.totalPages)"
        progressView.setProgress(currentProgress, animated: true)
        bookImage.image = UIImage(data:book.photo!)!
        return cell
    }

    // delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            bookManager.removeFavourite(rowIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        favouriteBooksTable.reloadData()
        booksFinishedCount.text = String(bookManager.favouriteCount())
    }

    @IBOutlet weak var yourProfile: UILabel!

    @IBOutlet weak var booksFinished: UILabel!

    @IBOutlet weak var booksFinishedCount: UILabel!

    @IBOutlet weak var favouriteBooks: UILabel!

    @IBOutlet weak var favouriteBooksTable: UITableView!

    @IBAction func addBook(_ sender: Any) {
    }

    let bookManager = BookManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteBooksTable.delegate = self
        favouriteBooksTable.dataSource = self
        booksFinishedCount.text = String(bookManager.favouriteCount())
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _ = sender as? UITableViewCell else {
            return
        }
        guard let selectedRow = self.favouriteBooksTable.indexPathForSelectedRow else {
            return
        }
        let destination = segue.destination as? BookViewController
        let selectedBook = bookManager.getFavourite(index: selectedRow.row)
        destination!.book = selectedBook
    }
}

