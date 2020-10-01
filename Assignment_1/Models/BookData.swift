//
//  BookData.swift
//  Assignment_1
//
//  Created by Philip Beeby on 29/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation

enum BookData: String, CaseIterable {
    
    case Book1, Book2, Book3, Book4, Book5,
    Book6, Book7, Book8
    
    var title:String {
        switch self {
        case .Book1: return "Gone with the Wind"
        case .Book2: return "Essays"
        case .Book3: return "Cloud Computing"
        case .Book4: return "Introduction to Java Programming"
        case .Book5: return "Lord of the Flies"
        case .Book6: return "Catch 22"
        case .Book7: return "middle"
        case .Book8: return "The Time Machine"
        }
    }
    
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

