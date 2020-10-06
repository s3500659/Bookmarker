//
//  BookDataViewModel.swift
//  Assignment_1
//
//  Created by Vinh Tran on 6/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit

struct BookDataViewModel {
    
    private (set) static var books:[Book] = []
    
    init() {
        loadBooks()
    }
    
    mutating func add(book:Book) {
        BookDataViewModel.books.append(book)
    }
    
    
    mutating func loadBooks() {
        let book1 = Book(title: "Horus Rising", author: "Dan Abnett", totalPages: 416, currentPage: 10, photo: UIImage(named: "sample"))!
        BookDataViewModel.books.append(book1)
        
        let book2 = Book(title: "Gone with the Wind", author: "Margaret Mitchell", totalPages: 416, currentPage: 10, photo: UIImage(named: "gone"))!
        BookDataViewModel.books.append(book2)
        
        let book3 = Book(title: "Essays", author: "George Orwell", totalPages: 416, currentPage: 10, photo: UIImage(named: "essays"))!
        BookDataViewModel.books.append(book3)
        
        let book4 = Book(title: "Cloud Computing", author: "John Smith", totalPages: 416, currentPage: 10, photo: UIImage(named: "cloud"))!
        BookDataViewModel.books.append(book4)
        
        let book5 = Book(title: "Introduction to Java Programming", author: "Paul Jones", totalPages: 416, currentPage: 10, photo: UIImage(named: "intro"))!
        BookDataViewModel.books.append(book5)
        
        let book6 = Book(title: "Lord of the Flies", author: "William Golding", totalPages: 416, currentPage: 10, photo: UIImage(named: "lord"))!
        BookDataViewModel.books.append(book6)
        
        let book7 = Book(title: "Catch 22", author: "Joseph Heller", totalPages: 416, currentPage: 10, photo: UIImage(named: "catch"))!
        BookDataViewModel.books.append(book7)
        
        let book8 = Book(title: "Middle", author: "George Elliot", totalPages: 416, currentPage: 10, photo: UIImage(named: "middle"))!
        BookDataViewModel.books.append(book8)
        
        let book9 = Book(title: "The Time Machine", author: "H.G. Wells", totalPages: 416, currentPage: 10, photo: UIImage(named: "time"))!
        BookDataViewModel.books.append(book9)
        
    }
    
    
}
