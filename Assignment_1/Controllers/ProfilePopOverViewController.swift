//
//  ProfilePopOverViewController.swift
//  Assignment_1
//
//  Created by Josh on 7/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class ProfilePopOverViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookSearchCell", for: indexPath)
        cell.textLabel?.text=bookData[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var bookSearchTable: UITableView!
    @IBOutlet weak var bookSearchBar: UISearchBar!
    
    var bookData:[String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookSearchTable.delegate=self
        bookSearchTable.dataSource=self
        
        
        //temp dummy data
        for index in 0...20{
            bookData.append(String(index))
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
