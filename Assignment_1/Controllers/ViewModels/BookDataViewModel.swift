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
        let book1 = Book(title: "Horus Rising", author: "Dan Abnett", totalPages: 416, currentPage: 0, photo: UIImage(named: "sample"), isbn: "97818844162949", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book1)
        
        let book2 = Book(title: "Gone with the Wind", author: "Margaret Mitchell", totalPages: 321, currentPage: 0, photo: UIImage(named: "gone"), isbn: "32674754745745", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book2)
        
        let book3 = Book(title: "Essays", author: "George Orwell", totalPages: 456, currentPage: 0, photo: UIImage(named: "essays"), isbn: "234786865865", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book3)
        
        let book4 = Book(title: "Cloud Computing", author: "John Smith", totalPages: 543, currentPage: 0, photo: UIImage(named: "cloud"), isbn: "23434647427547", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book4)
        
        let book5 = Book(title: "Introduction to Java Programming", author: "Paul Jones", totalPages: 234, currentPage: 0, photo: UIImage(named: "intro"), isbn: "567845435434", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book5)
        
        let book6 = Book(title: "Lord of the Flies", author: "William Golding", totalPages: 356, currentPage: 0, photo: UIImage(named: "lord"), isbn: "7636453463436", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book6)
        
        let book7 = Book(title: "Catch 22", author: "Joseph Heller", totalPages: 456, currentPage: 0, photo: UIImage(named: "catch"), isbn: "84364364364363463", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book7)
        
        let book8 = Book(title: "Middle", author: "George Elliot", totalPages: 121, currentPage: 0, photo: UIImage(named: "middle"), isbn: "523532532532532", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book8)
        
        let book9 = Book(title: "The Time Machine", author: "H.G. Wells", totalPages: 333, currentPage: 0, photo: UIImage(named: "time"), isbn: "75235466544423", publisher: "Goodreads", description: "book description here")!
        BookDataViewModel.books.append(book9)
        
    }
    
    
}
