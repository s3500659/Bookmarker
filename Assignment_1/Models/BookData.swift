//
//  BookData.swift
//  Assignment_1
//
//  Created by Philip Beeby on 29/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation

enum BookData: String {
    
    case Book1 = "Gone with the Wind ", Book2 = "Essays", Book3 = "Cloud Computing", Book4 = "Introduction to Java Programming", Book5 = "Lord of the Flies",
    Book6 = "Catch 22", Book7 = "Middlemarch", Book8 = "The Time Machine"
    
    var imageName: String{
        switch self {
        case .Book1: return "gone"
        case .Book2: return "essays"
        case .Book3: return "cloud"
        case .Book4: return "intro"
        case .Book5: return "lord"
        case .Book6: return "catch"
        case .Book7: return "middle"
        case .Book8: return "time"
        }
    }
    
    var author: String{
        switch self {
        case .Book1: return "Margaret Mitchell"
        case .Book2: return "George Orwell"
        case .Book3: return "John Smith"
        case .Book4: return "Paul Jones"
        case .Book5: return "William Golding"
        case .Book6: return "Joseph Heller"
        case .Book7: return "George Elliot"
        case .Book8: return "H.G. Wells"
        }
    }
}

