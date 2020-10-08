//
//  StudentViewModel.swift
//  Assignment_1
//
//  Created by Vinh Tran on 2/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit

struct StudentViewModel {
    
    var students:[Student] = []
    
    init() {
        populateStudents()
    }
    
    mutating func populateStudents() {
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
            description: "I currently work full time as a web developer using Ruby on Rails while completing my final unit for my Bachelor of IT. I enjoy solving complex programming problems.",
            image: UIImage(named: "simba_1")!,
            hobbies: "Video games, boxing, web development and fishing",
            additionalInfo: "In my spare time I am trying to find the best fishing spots, playing video games or working on hobby development projects.")
        
        students.append(vinh)
        students.append(jordan)
        students.append(philip)
        students.append(josh)
        

    }
}
