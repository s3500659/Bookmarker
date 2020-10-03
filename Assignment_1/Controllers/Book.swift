//
//  Book.swift
//  Assignment_1
//
//  Created by Jordan Watson on 22/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//


/*
import UIKit

class Book {
    // MARK: Properties
    
    var title: String
    var author: String
    var totalPages: intmax_t
    var currentPage: intmax_t
    var photo: UIImage?
    
    // MARK: Initialize
    
    init?(title: String, author: String, totalPages: intmax_t, currentPage: intmax_t, photo: UIImage?) {
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
    }
}
*/


import UIKit

class Book{
    // MARK: Properties
    private var title: String
    private var author: String
    private var totalPages: intmax_t
    private var currentPage: intmax_t
    private var photo: UIImage?
    
    // MARK: Initialize
    
    init?(title: String, author: String, totalPages: intmax_t, currentPage: intmax_t, photo: UIImage?) {
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
    }
    
    // MARK: getters
    func getTitle()->String{
        return title
    }
    func getAuthor() ->String{
        return author
    }
    func getTotalPages() ->intmax_t {
        return totalPages
    }
    func getCurrentPage() -> intmax_t{
        return currentPage
    }
    func getPhoto() -> UIImage?{
        return photo
    }
    
}

