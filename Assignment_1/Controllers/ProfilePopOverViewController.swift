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
        title.text = filteredData[indexPath.row]
        //explicitly enable interaction in cells
        cell.contentView.isUserInteractionEnabled = true
        return cell
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData=[]
        for book in bookData{
            if(book.lowercased().contains(searchText.lowercased())){
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
            for book in bookData{
                if book == currentText{
                    tempBookData.append(book)
                }
            }
            //hide the button
            let currentButton = currentCell!.viewWithTag(1001) as! UIButton
            currentButton.isHidden=true

        }
    }

    
    @IBAction func cancelButton(_ sender: Any) {
        //add the selected books to favourites
        filteredData.append(contentsOf: tempBookData)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        //todo should save data
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var bookSearchTable: UITableView!
    
    @IBOutlet weak var bookSearchBar: UISearchBar!
    
    @IBOutlet var profilePopOverView: UIView!

    
    var bookData:[String] = []
    var filteredData: [String]!
    var tempBookData: [String] = [] //holds bookData to be added to favourites

    
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
      
        //temp dummy data
        for index in 0...20{
            bookData.append(String(index))
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
