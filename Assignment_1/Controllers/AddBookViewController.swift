//
//  ProfilePopOverViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookSearchCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let isbn = cell.viewWithTag(1002) as! UILabel
        let image = cell.viewWithTag(1003) as! UIImageView
        
        title.text=filteredData[indexPath.row].title
        author.text=filteredData[indexPath.row].author
        isbn.text=filteredData[indexPath.row].isbn
        image.image=filteredData[indexPath.row].photo
        
        // bookImage=BookDataViewModel.favouriteBooksLibrary[indexPath.row].photo!
        //explicitly enable interaction in cells
        cell.contentView.isUserInteractionEnabled = true
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData=[]
        for book in bookData{
            if(book.title.lowercased().contains(searchText.lowercased())){
                filteredData.append(book)
            }
        }
        bookSearchTable.reloadData()
    }
    
    @IBAction func addBookButton(_ sender: UIButton) {
        let buttonPos = sender.convert(sender.bounds.origin, to: bookSearchTable)
        if let indexPath = bookSearchTable.indexPathForRow(at: buttonPos) {
            let currentCell = bookSearchTable.cellForRow(at: indexPath)
            //if the element exists add it
            tempBookData.append(BookDataViewModel.apiBooks[indexPath.row])
            //hide the button
            let currentButton = currentCell!.viewWithTag(1005) as! UIButton
            currentButton.isHidden=true
            
        }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        //add the selected books to books
        BookDataViewModel.books.append(contentsOf: tempBookData)
        bookSearchTable.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func loadBooks(){
        for book in BookDataViewModel.apiBooks{
            bookData.append(book)
        }
    }
    
    @IBOutlet weak var bookSearchTable: UITableView!
    
    
    @IBOutlet var profilePopOverView: UIView!
    
    @IBOutlet weak var bookSearchBar: UISearchBar!
    
    var bookData:[Book] = []
    var filteredData: [Book]!
    var tempBookData:[Book] = [] //holds bookData to be added to favourites
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookSearchTable.delegate=self
        bookSearchTable.dataSource=self
        bookSearchBar.delegate = self
        
        loadBooks()
        filteredData = bookData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.preferredContentSize = self.view.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
