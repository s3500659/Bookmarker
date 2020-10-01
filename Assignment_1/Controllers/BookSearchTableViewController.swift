//
//  BookSearchTableViewController.swift
//  Assignment_1
//
//  Created by Philip Beeby on 29/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class BookSearchTableViewController: UIViewController {
    
    // 1 - need connection to the ViewModel
    
    private let viewModel = BookDataSearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let imageView = cell.viewWithTag(1000) as? UIImageView
        let bookTitle = cell.viewWithTag(1001) as? UILabel
        let bookAuthor = cell.viewWithTag(1002) as? UILabel
        // creates local variables of same vars as above
        if let imageView = imageView, let bookTitle = bookTitle, let bookAuthor = bookAuthor
        {
            let currentBook = viewModel.getBook(byIndex: indexPath.row)
            imageView.image = currentBook.image
            bookTitle.text = currentBook.title
            bookAuthor.text = currentBook.author

        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
