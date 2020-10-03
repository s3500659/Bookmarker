//
//  SearchBookTableViewController.swift
//  Assignment_1
//
//  Created by Philip Beeby on 30/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class SearchBookTableViewController: UITableViewController ,UISearchBarDelegate {
    
    // 1 - need connection to the ViewModel
    
    var viewModel = SearchBooksViewModel()

    @IBOutlet weak var searchBar: UISearchBar!
    //var data :[String] = []
    var data:[Book?]=[]
    var filteredData: [Book?]!


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        data = viewModel.getBooks()
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #counts the number of books in the BookData file
        return filteredData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        // change this
        let imageView = cell.viewWithTag(1000) as? UIImageView
        let bookTitle = cell.viewWithTag(1001) as? UILabel
        let bookAuthor = cell.viewWithTag(1002) as? UILabel
        // creates local variables of same vars as above
        if let imageView = imageView, let bookTitle = bookTitle, let bookAuthor = bookAuthor
        {
            let currentBook = viewModel.getBook(byIndex: indexPath.row)
            imageView.image = currentBook?.getPhoto()
            bookTitle.text = currentBook?.getTitle()
            bookAuthor.text = currentBook?.getAuthor()
        }
        cell.textLabel?.text = filteredData[indexPath.row]?.getTitle()
        return cell
    }
    
    /// This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        /*
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
 */
       
        for case let book? in data {
            if  !book.getTitle().isEmpty && book.getTitle().contains(searchText){
                filteredData.append(book)
            }
        }
        
        tableView.reloadData()
    }

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {return}
        let destination = segue.destination as? DetailSearchBooksViewController
        let selectedBook = viewModel.getBook(byIndex: selectedRow.row)
        destination?.selectedBook = selectedBook 
    }
    
    
}
