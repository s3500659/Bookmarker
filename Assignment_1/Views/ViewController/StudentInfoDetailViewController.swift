//
//  StudentInfoDetailViewController.swift
//  Assignment_1
//
//  Created by Vinh Tran on 29/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class StudentInfoDetailViewController: UIViewController {

    var selectedStudent: Student?

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var about: UITextView!
    @IBOutlet weak var hobbies: UITextView!
    @IBOutlet weak var additionalInfo: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedStudent = selectedStudent {
            image.image = selectedStudent.image
            studentName.text = selectedStudent.name + " " + selectedStudent.studentNumber
            about.text = "About\n" + selectedStudent.description
            hobbies.text = "Hobbies\n" + selectedStudent.hobbies
            additionalInfo.text = "Additional Information\n" + selectedStudent.additionalInfo
        }
    }
}
