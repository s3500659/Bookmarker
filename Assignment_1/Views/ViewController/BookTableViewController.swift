//
//  BookTableViewController.swift
//  Assignment_1
//
//  Created by Jordan Watson on 22/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class BookTableViewController: UITableViewController {

    let bookManager = BookManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        bookManager.loadBooks()
    }


    override func viewWillAppear(_ animated: Bool) {
        bookManager.loadBooks()
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookManager.getCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BookTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BookTableViewCell else {
            fatalError("The dequeued cell is not an instance of BookTableViewCell")
        }
        let book = bookManager.getBook(indexRow: indexPath.row)
        let progress: Float = Float(book.currentPage) / Float(book.totalPages)
        if let photo = book.photo{
            cell.photoImageView.image = UIImage(data: photo)
        }
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.progressLabel.text = "Page \(book.currentPage) of \(book.totalPages)"
        cell.completedProgressView.setProgress(progress, animated: true)
        return cell
    }

    // delete cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            bookManager.removeBook(rowIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard let selectedRow = self.tableView.indexPathForSelectedRow else {return}
        let destination = segue.destination as? BookViewController
        let selectedBook = bookManager.getBook(indexRow: selectedRow.row)
        destination?.book = selectedBook
    }

}
