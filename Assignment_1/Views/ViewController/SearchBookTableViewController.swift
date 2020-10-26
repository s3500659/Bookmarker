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
  
    var filteredData: [Book]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = BookDataViewModel.books

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // counts the number of books in the BookData file
        return filteredData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchBookCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let progress = cell.viewWithTag(1002) as! UILabel
        let progressView = cell.viewWithTag(1003) as! UIProgressView
        let image = cell.viewWithTag(1004) as! UIImageView
        let currentProgress: Float = Float(filteredData[indexPath.row].currentPage) / Float(filteredData[indexPath.row].totalPages)
        title.text=filteredData[indexPath.row].title
        author.text=filteredData[indexPath.row].author
        progress.text="Page \(filteredData[indexPath.row].currentPage) of \(filteredData[indexPath.row].totalPages)"
        progressView.setProgress(currentProgress, animated: true)
        image.image = filteredData[indexPath.row].photo
        return cell
    }

    /// This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData=[]
        for book in BookDataViewModel.books{
            if book.title.lowercased().contains(searchText.lowercased()){
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
        let destination = segue.destination as? BookViewController
        //todo fix
       // let selectedBook = BookDataViewModel.books[selectedRow.row]
       // destination?.book = selectedBook
    }

    // MARK: Private methods

    /*
    private func loadBookData() {
        for i in BookDataViewModel.books {
            data.append(i.title)
            bookImageData.append(i.photo!)
        }
    }
    */
}
