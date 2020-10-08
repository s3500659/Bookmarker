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

    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var bookSearchTable: UITableView!
    
    @IBOutlet weak var bookSearchBar: UISearchBar!
    
    @IBOutlet var profilePopOverView: UIView!
    
    
    var bookData:[String] = []
    var filteredData: [String]!


    
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
