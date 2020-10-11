//
//  Book.swift
//  Assignment_1
//
//  Created by Jordan Watson on 22/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import UIKit

class Book {
    // MARK: Properties
    var title: String
    var author: String
    var totalPages: Int
    var currentPage: Int
    var photo: UIImage?
    
    var notes:String = "Enter notes here"
    private (set) var isbn:String
    private (set) var publisher:String
    private (set) var description:String
    var startDate:Date?

    
    
    // MARK: Initialize
    
    init?(title: String, author: String, totalPages: intmax_t, currentPage: intmax_t, photo: UIImage?, isbn:String, publisher:String, description:String) {
        // Book name can't be empty
        guard !title.isEmpty else {
            return nil
        }
        
        // Current page the user is up to must be greater than or equal to zero
        // It must also be less than the total number of pages in the book
        guard (currentPage >= 0 && currentPage <= totalPages) else {
            return nil
        }
        
        self.title = title
        self.author = author
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.photo = photo
        self.isbn = isbn
        self.publisher = publisher
        self.description = description
    }
}
