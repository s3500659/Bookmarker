//
//  Student.swift
//  Assignment_1
//
//  Created by Vinh Tran on 25/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit

class Student {
    
    private (set) var name:String
    private (set) var studentNumber:String
    private (set) var description:String
    private (set) var image: UIImage
    
    private (set) var hobbies:String
    private (set) var additionalInfo:String
    
    init(name:String, studentNumber:String, description:String, image:UIImage, hobbies:String, additionalInfo:String) {
        self.name = name
        self.studentNumber = studentNumber
        self.description = description
        self.image = image
        self.hobbies = hobbies
        self.additionalInfo = additionalInfo
    }
    
}
