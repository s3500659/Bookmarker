//
//  BookTableViewController.swift
//  Assignment_1
//
//  Created by Jordan Watson on 22/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class BookTableViewController: UITableViewController {
    
    // MARK: Properties
    var books = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleBook()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BookTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BookTableViewCell else {
            fatalError("The dequeued cell is not an instance of BookTableViewCell")
        }

        let book = books[indexPath.row]
        let progress: Float = Float(book.currentPage) / Float(book.totalPages)
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.progressLabel.text = "Page \(book.currentPage) of \(book.totalPages)"
        cell.photoImageView.image = book.photo
        cell.completedProgressView.setProgress(progress, animated: true)
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "ShowDetail":
            guard let bookDetailViewController = segue.destination as? BookViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedBookCell = sender as? BookTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "")")
            }
            guard let indexPath = tableView.indexPath(for: selectedBookCell) else {
                fatalError("The selected cell is not beig displayed by the table")
            }
            
            let selectedBook = books[indexPath.row]
            bookDetailViewController.book = selectedBook
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier ?? "")")
        }
    }

    // MARK: Private methods
    
    private func loadSampleBook() {
        let sampleImage = UIImage(named: "sample")
        guard let sampleBook = Book(title: "Horus Rising", author: "Dan Abnett", totalPages: 416, currentPage: 10, photo: sampleImage) else {
            fatalError("Unable to create sample book")
        }
        books += [sampleBook]
    }
}
