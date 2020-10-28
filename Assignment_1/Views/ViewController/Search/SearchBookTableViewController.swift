//
//  SearchBookTableViewController.swift
//  Assignment_1
//
//  Created by Philip Beeby on 30/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class SearchBookTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!

    var filteredData: [Book] = []
    let bookManager = BookManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        bookManager.loadBooks()
        filteredData = bookManager.getBooks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookManager.loadBooks()
        filteredData = bookManager.getBooks
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchBookCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let progress = cell.viewWithTag(1002) as! UILabel
        let progressView = cell.viewWithTag(1003) as! UIProgressView
        let bookImage = cell.viewWithTag(1004) as! UIImageView
        let book = filteredData[indexPath.row]
        let currentProgress: Float = Float(book.currentPage) / Float(book.totalPages)
        if let photo = book.photo {
            bookImage.image = UIImage(data: photo)
        }
        title.text = book.title
        author.text = book.author
        progress.text = "Page \(book.currentPage) of \(book.totalPages)"
        progressView.setProgress(currentProgress, animated: true)
        return cell
    }

    /// This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        for book in bookManager.getBooks {
            if book.title.lowercased().contains(searchText.lowercased()) {
                filteredData.append(book)
            }
        }
        tableView.reloadData()
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {
            return
        }
        let destination = segue.destination as? BookDetailViewController
        let selectedBook = filteredData[selectedRow.row]
        destination?.book = selectedBook
    }
}

