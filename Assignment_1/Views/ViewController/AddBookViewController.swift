//
//  ProfilePopOverViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, Refresh {
    func updateUI() {
        bookSearchTable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookApi.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookSearchCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let isbn = cell.viewWithTag(1002) as! UILabel
        let image = cell.viewWithTag(1003) as! UIImageView
        let addButton = cell.viewWithTag(1005) as! UIButton
        let book = bookApi.getBook(index: indexPath.row)
        title.text = book.title
        author.text = book.author
        isbn.text = "ISBN: \(book.isbn)"
        if let photo = book.photo{
            image.image = UIImage(data: photo)
        }
        //disable add for existing books
        for b in bookManager.getBooks{
            if b.isbn == book.isbn{
                addButton.isEnabled = false
                addButton.isHidden = true
            }
        }
        //explicitly enable interaction in cells
        cell.contentView.isUserInteractionEnabled = true
        return cell
    }


    @IBAction func addBookButton(_ sender: UIButton) {
        let buttonPos = sender.convert(sender.bounds.origin, to: bookSearchTable)
        if let indexPath = bookSearchTable.indexPathForRow(at: buttonPos) {
            let currentCell = bookSearchTable.cellForRow(at: indexPath)
            //if the element exists add it
            tempBookData.append(bookApi.getBook(index: indexPath.row))
            //hide the button
            let currentButton = currentCell!.viewWithTag(1005) as! UIButton
            currentButton.isHidden = true
        }
    }


    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButton(_ sender: Any) {
        //add the selected books to books
        for book in self.tempBookData {
            self.bookManager.addBook(book: book)
        }
        self.bookSearchTable.reloadData()
        dismiss(animated: true, completion: nil)
    }


    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {
            return
        }
        let searchType = searchSelection.selectedSegmentIndex         //get the index
        bookApi.searchBooks(searchTerm: searchTerm, queryType: searchType)
    }

    @IBOutlet weak var bookSearchTable: UITableView!
    @IBOutlet var profilePopOverView: UIView!
    @IBOutlet weak var bookSearchBar: UISearchBar!
    @IBOutlet weak var searchSelection: UISegmentedControl!

    var tempBookData: [Book] = [] //holds data that may be added to books
    var bookApi = bookViewModel() //api
    let bookManager = BookManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        bookSearchTable.delegate = self
        bookSearchTable.dataSource = self
        bookSearchBar.delegate = self
        bookApi.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.preferredContentSize = self.view.systemLayoutSizeFitting(
                UIView.layoutFittingCompressedSize)
    }
}
