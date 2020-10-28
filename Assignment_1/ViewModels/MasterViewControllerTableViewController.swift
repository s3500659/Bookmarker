//
//  MasterViewControllerTableViewController.swift
//  Assignment_1
//
//  Created by Philip Beeby on 11/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class MasterViewControllerTableViewController: UITableViewController {

    private let viewModel = StudentViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    @IBOutlet weak var studentName: UITableViewCell!


    override func tableView(
            _ tableView: UITableView,
            numberOfRowsInSection section: Int)
                    -> Int {
        return viewModel.students.count
    }

    override func tableView(
            _ tableView: UITableView,
            cellForRowAt indexPath: IndexPath)
                    -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        let student = viewModel.students[indexPath.row]

//            cell.studentImage.image = student.image
//            let monster = monsters[indexPath.row]
        cell.textLabel?.text = student.fullName

        return cell
    }


//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellIdentifier = "studentCell"
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StudentInfoTableViewCell else {
//            fatalError("The dequeued cell is not an instance of StudentInfoTableViewCell")
//        }
//
//        let student = viewModel.students[indexPath.row]
//        cell.studentLabel.text = student.name
//        cell.studentDescription.text = student.description
//        cell.studentImage.image = student.image
//
//        return cell
//    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let selectedRow = self.tableView.indexPathForSelectedRow else {
            return
        }

        let destination = segue.destination as? StudentInfoDetailViewController
        let selectedStudent = viewModel.students[selectedRow.row]
        destination?.selectedStudent = selectedStudent
    }
}


