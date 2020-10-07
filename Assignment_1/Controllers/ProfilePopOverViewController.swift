//
//  ProfilePopOverViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class ProfilePopOverViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookSearchCell", for: indexPath)
        cell.textLabel?.text=filteredData[indexPath.row]
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
    

    @IBOutlet var profilePopOverView: UIView!
    
    
    @IBOutlet weak var bookSearchTable: UITableView!
    @IBOutlet weak var bookSearchBar: UISearchBar!
    
    var bookData:[String] = []
    var filteredData: [String]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookSearchTable.delegate=self
        bookSearchTable.dataSource=self
        bookSearchBar.delegate = self

        //temp dummy data
        for index in 0...20{
            bookData.append(String(index))
        }
        filteredData = bookData
    }
    
    /*
     // Close PopUp
     @IBAction func closePopup(_ sender: Any) {
     
     dismiss(animated: true, completion: nil)
     }

     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
