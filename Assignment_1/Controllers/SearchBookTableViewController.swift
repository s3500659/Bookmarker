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
    
    //var viewModel = BookDataViewModel()

    @IBOutlet weak var searchBar: UISearchBar!
    var data :[String] = []
    
    var filteredData: [String]!
    
    func loadBookData() {
        for i in BookDataViewModel.books {
            data.append(i.title)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBookData()
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

        cell.textLabel?.text = filteredData[indexPath.row]
        
        
        return cell
    }
    
    /// This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {return}
        let destination = segue.destination as? BookViewController
        let selectedBook = BookDataViewModel.books[selectedRow.row]
        destination?.book = selectedBook
        
        
    }
    
    
}
