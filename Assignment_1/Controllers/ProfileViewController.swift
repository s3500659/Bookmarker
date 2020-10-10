//
//  ProfileViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookDataViewModel.favouriteBooksLibrary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteBookCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let progress = cell.viewWithTag(1002) as! UILabel
        let progressView = cell.viewWithTag(1003) as! UIProgressView
        let image = cell.viewWithTag(1004) as! UIImageView

        //var bookImage = cell.viewWithTag(1004) as! UIImage

        let currentProgress: Float = Float(BookDataViewModel.favouriteBooksLibrary[indexPath.row].currentPage) / Float(BookDataViewModel.favouriteBooksLibrary[indexPath.row].totalPages)

        title.text=BookDataViewModel.favouriteBooksLibrary[indexPath.row].title
        author.text=BookDataViewModel.favouriteBooksLibrary[indexPath.row].author
        progress.text="Page \(BookDataViewModel.favouriteBooksLibrary[indexPath.row].currentPage) of \(BookDataViewModel.favouriteBooksLibrary[indexPath.row].totalPages)"
        progressView.setProgress(currentProgress, animated: true)
        image.image = BookDataViewModel.favouriteBooksLibrary[indexPath.row].photo
        return cell
    }
    
    @IBOutlet weak var yourProfile: UILabel!
    
    @IBOutlet weak var booksFinished: UILabel!
    
    @IBOutlet weak var booksFinishedCount: UILabel!
    
    @IBOutlet weak var favouriteBooks: UILabel!
    
    @IBOutlet weak var favouriteBooksTable: UITableView!
    
    @IBAction func addBook(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteBooksTable.delegate=self
        favouriteBooksTable.dataSource=self
        booksFinishedCount.text=String(BookDataViewModel.favouriteBooksLibrary.count)
        //set the profile popover delegate listener
        let popOverVC = ProfilePopOverViewController()
        popOverVC.updateDelegate = self
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedRow = self.favouriteBooksTable.indexPathForSelectedRow else {return}
        let destination = segue.destination as? BookViewController
        let selectedBook = BookDataViewModel.favouriteBooksLibrary[selectedRow.row]
        destination!.book = selectedBook
    }
}

extension ProfileViewController: BookUpdateDelegate {
    func addedBooks(finished: Bool) {
        print("Updated!")
        guard finished else {return}
        favouriteBooksTable.reloadData()
    }
}
