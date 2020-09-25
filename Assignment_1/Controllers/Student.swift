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
    private (set) var description:String
    private (set) var image: UIImage
    
    init(name:String, description:String, image:UIImage) {
        self.name = name
        self.description = description
        self.image = image
    }
    
}
