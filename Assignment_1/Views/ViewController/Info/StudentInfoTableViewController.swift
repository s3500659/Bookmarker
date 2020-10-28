//
//  StudentInfoTableViewController.swift
//  Assignment_1
//
//  Created by Vinh Tran on 25/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class StudentInfoTableViewController: UITableViewController {

    private let viewModel = StudentViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.students.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "studentCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StudentInfoTableViewCell else {
            fatalError("The dequeued cell is not an instance of StudentInfoTableViewCell")
        }

        let student = viewModel.students[indexPath.row]
        cell.studentLabel.text = student.name
        cell.studentDescription.text = student.description
        cell.studentImage.image = student.image

        return cell
    }


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


