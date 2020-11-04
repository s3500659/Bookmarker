//
//  StudentInfoTableViewController.swift
//  Assignment_1
//
//  Created by Vinh Tran on 25/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class StudentInfoTableViewController: UITableViewController, UISplitViewControllerDelegate {

    private let viewModel = StudentViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
        splitViewController?.preferredDisplayMode = .allVisible

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "studentDetail") as! StudentInfoDetailViewController
        vc.selectedStudent = viewModel.students[indexPath.row]
        splitViewController?.showDetailViewController(vc, sender: nil)
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
}


