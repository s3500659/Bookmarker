//
//  ProfilePopOverViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class ProfilePopOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookSearchCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let isbn = cell.viewWithTag(1002) as! UILabel
        let image = cell.viewWithTag(1003) as! UIImageView
        let addButton = cell.viewWithTag(1005) as! UIButton
        let book = filteredData[indexPath.row]
        if let photo = book.photo{
            image.image = UIImage(data: photo)
        }
        title.text = book.title
        author.text = book.author
        isbn.text = "ISBN: \(book.isbn)"
        for b in bookManager.getFavourites() {
            if filteredData[indexPath.row].isbn == b.isbn {
                addButton.isEnabled = false
                addButton.isHidden = true
            }
        }
        cell.contentView.isUserInteractionEnabled = true
        return cell
    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        for book in bookManager.getBooks {
            if (book.title.lowercased().contains(searchText.lowercased())) {
                filteredData.append(book)
            }
        }
        bookSearchTable.reloadData()
    }

    @IBAction func addBookButton(_ sender: UIButton) {
        let buttonPos = sender.convert(sender.bounds.origin, to: bookSearchTable)
        if let indexPath = bookSearchTable.indexPathForRow(at: buttonPos) {
            let currentCell = bookSearchTable.cellForRow(at: indexPath)
            tempBookData.append(filteredData[indexPath.row])
            let currentButton = currentCell!.viewWithTag(1005) as! UIButton
            currentButton.isHidden = true
        }
    }


    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButton(_ sender: Any) {
        for book in tempBookData {
            bookManager.addFavourite(book: book)
        }
        dismiss(animated: true, completion: nil)
    }


    @IBOutlet weak var bookSearchTable: UITableView!

    @IBOutlet var profilePopOverView: UIView!

    @IBOutlet weak var bookSearchBar: UISearchBar!

    var filteredData: [Book] = []
    var tempBookData: [Book] = []
    let bookManager = BookManager.shared


    override func viewDidLoad() {
        super.viewDidLoad()
        bookSearchTable.delegate = self
        bookSearchTable.dataSource = self
        bookSearchBar.delegate = self
        bookManager.fetchBooks()
        bookManager.loadFavourites()
        filteredData=bookManager.getBooks
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.preferredContentSize = self.view.systemLayoutSizeFitting(
                UIView.layoutFittingCompressedSize)
    }
}


