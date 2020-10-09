//
//  ProfilePopOverViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class ProfilePopOverViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookSearchCell", for: indexPath)
        let title = cell.viewWithTag(1000) as! UILabel
        let author = cell.viewWithTag(1001) as! UILabel
        let isbn = cell.viewWithTag(1002) as! UILabel
        title.text=filteredData[indexPath.row].title
        author.text=filteredData[indexPath.row].author
        isbn.text=filteredData[indexPath.row].isbn

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
            let currentLabel = currentCell!.viewWithTag(1000) as! UILabel
            guard let currentText = currentLabel.text else{ return }
            print(currentText)
            //if the element exists add it
            tempBookData.append(Book(title: currentText, author: "", totalPages: 0, currentPage: 0, photo:nil, isbn: "1", publisher: "", description: "")!)
            //hide the button
            let currentButton = currentCell!.viewWithTag(1005) as! UIButton
            currentButton.isHidden=true
            
        }
    }
    
   
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        //add the selected books to favourites
        BookDataViewModel.favouriteBooksLibrary.append(contentsOf: tempBookData)
        bookSearchTable.reloadData()
        //todo remove this and refresh favouriteBooksTable
        for book in BookDataViewModel.favouriteBooksLibrary{
            print(book.title)
        }
        dismiss(animated: true, completion: nil)
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
        
        /* todo
        //set size
        self.view.widthAnchor.constraint(
            equalToConstant: 500
            ).isActive = true
        self.view.heightAnchor.constraint(
            equalToConstant: 300
            ).isActive = true

        self.popoverPresentationController?.sourceRect = CGRect(x: view.center.x, y: view.center.y, width: 0, height: 0)
        self.popoverPresentationController?.sourceView = view
        self.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        */
      
        for book in BookDataViewModel.books{
            bookData.append(book)
        }
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
