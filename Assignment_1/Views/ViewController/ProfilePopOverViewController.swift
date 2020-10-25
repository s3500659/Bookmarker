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
        title.text = book.title
        author.text = book.author
        isbn.text = "ISBN: \(book.isbn)"
        image.image = UIImage(data:book.photo!)
        //disable add for existing books
        for book in bookManager.getFavourites() {
            if filteredData[indexPath.row].isbn == book.isbn {
                addButton.isEnabled = false
                addButton.isHidden = true
            }
        }
        //explicitly enable interaction in cells
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
            tempBookData.append(filteredData[indexPath.row])                  //if the element exists add it
            let currentButton = currentCell!.viewWithTag(1005) as! UIButton   //hide the button
            currentButton.isHidden = true
        }
    }


    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButton(_ sender: Any) {
        for book in tempBookData {         //add the selected books to favourites
            bookManager.addFavourite(book: book)
        }
        dismiss(animated: true, completion: nil)
    }


    @IBOutlet weak var bookSearchTable: UITableView!

    @IBOutlet var profilePopOverView: UIView!

    @IBOutlet weak var bookSearchBar: UISearchBar!

    var filteredData: [Book] = []
    var tempBookData: [Book] = [] //holds bookData to be added to favourites
    let bookManager = BookManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        bookSearchTable.delegate = self
        bookSearchTable.dataSource = self
        bookSearchBar.delegate = self
        bookManager.fetchBooks()
        filteredData=bookManager.getBooks
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.preferredContentSize = self.view.systemLayoutSizeFitting(
                UIView.layoutFittingCompressedSize)
    }
}


