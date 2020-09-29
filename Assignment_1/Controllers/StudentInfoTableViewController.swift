//
//  StudentInfoTableViewController.swift
//  Assignment_1
//
//  Created by Vinh Tran on 25/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class StudentInfoTableViewController: UITableViewController {
    
    var students:[Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        populateStudents()
    }
    
    func populateStudents() {
        let vinh = Student(
            name: "Vinh",
            studentNumber: "s3500659",
            description: "Currently a student studying a Bachelor of Information Technology at RMIT university. I enjoy learning the various concepts and technology taught in this course especially the programming side of thing even when it's difficult",
            image: UIImage(named: "lion_king_1")!,
            hobbies: "Brazillian jiu-jitsu, Video games, Food, Snowboarding",
            additionalInfo: "In my spare time I like to play video games, train BJJ, kickboxing, wrestling, travelling, going out to eat. I also love to snowboard so every winter you will find me and my friends hanging around Perisher sliding up and down the mountain.")
        
        let josh = Student(
            name: "Josh",
            studentNumber: "s3612419",
            description: "I began my journey into IOS app development in late August and have been hooked ever since. Helping to create BookMarker was an especially exciting task since it combined my love of reading and enthusiasm for app development.",
            image: UIImage(named: "lion_king_2")!,
            hobbies: "Photography, Hiking, Programming, Cycling, Reading.",
            additionalInfo: "")
        
        let philip = Student(
            name: "Philip",
            studentNumber: "s3666628",
            description: "I wanted to learn to write code after working in IT for many years but not able to understand how computer programs actually work. After studying part-time with RMIT since 2017, some of the mysteries have been uncovered but I realised that there is so much more I still don't understand.",
            image: UIImage(named: "lion_king_3")!,
            hobbies: "Running, reading, horror movie affionado, drinking cups of tea, playing video games, talking politics and philosophy.",
            additionalInfo: "Favourite place to visit:\nI recently went to Japan and was blown away by the culture and food and the amazingly efficient trains system. I also love to go back to the UK to catch up with my family and friends. I was back there in Feb where I had some old-fashioned English beer in the oldest pub in England.")
        
        let jordan = Student(
            name: "Jordan",
            studentNumber: "s3611566",
            description: "I'm currently working as a web developer and I am also a student at RMIT university pursuing my bachelor of Information Technology. I really enjoy the problem solving aspects of rogramming along with designing user interfaces",
            image: UIImage(named: "simba_1")!,
            hobbies: "Video games, programming, designing web apps",
            additionalInfo: "")
        
        students.append(vinh)
        students.append(jordan)
        students.append(philip)
        students.append(josh)
        
        
        
//        students.append(Student(name: "Vinh", description: "Description here", image: UIImage(named: "lion_king_1")!))
//        students.append(Student(name: "Jordan", description: "Description here", image: UIImage(named: "lion_king_2")!))
//        students.append(Student(name: "Phillip", description: "Description here", image: UIImage(named: "lion_king_3")!))
//        students.append(Student(name: "Joshua", description: "Description here", image: UIImage(named: "simba_1")!))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "studentCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StudentInfoTableViewCell else {
            fatalError("The dequeued cell is not an instance of StudentInfoTableViewCell")
        }
        
        let student = students[indexPath.row]
        cell.studentLabel.text = student.name
        cell.studentDescription.text = student.description
        cell.studentImage.image = student.image

        return cell
    }
    
    

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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {return}
        
        let destination = segue.destination as? StudentInfoDetailViewController
        let selectedStudent = students[selectedRow.row]
        destination?.selectedStudent = selectedStudent
    }


    

    


}


