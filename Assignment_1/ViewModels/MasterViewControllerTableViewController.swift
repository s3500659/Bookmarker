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
        cell.textLabel?.text = student.fullName

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {
            return
        }

        let destination = segue.destination as? StudentInfoDetailViewController
        let selectedStudent = viewModel.students[selectedRow.row]
        destination?.selectedStudent = selectedStudent
    }
}


