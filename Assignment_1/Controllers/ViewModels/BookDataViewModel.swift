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
    
    static var books:[Book] = []
    static var favouriteBooksLibrary:[Book] = []
    
    init() {
        loadBooks()
        loadFavouriteBooks()
    }
    
    mutating func add(book:Book) {
        BookDataViewModel.books.append(book)
    }
    
    mutating func favouriteBooksCount() ->Int{
        return BookDataViewModel.favouriteBooksLibrary.count
    }

    mutating func loadFavouriteBooks(){
        BookDataViewModel.favouriteBooksLibrary.append(BookDataViewModel.books[0])
        BookDataViewModel.favouriteBooksLibrary.append(BookDataViewModel.books[3])
        BookDataViewModel.favouriteBooksLibrary.append(BookDataViewModel.books[5])
    }
    
    
    
    mutating func loadBooks() {
        let book1 = Book(title: "Horus Rising", author: "Dan Abnett", totalPages: 416, currentPage: 0, photo: UIImage(named: "sample"), isbn: "97818844162949", publisher: "Goodreads", description: "At the dawn of the 31st millennium, the Imperium of Man has reasserted its dominance over the galaxy. It is a golden age of rediscovery and conquest, and the Emperor's Great Crusade has placed his superhuman primarch sons at the head of the mighty Space Marine Legions--the most powerful military force ever assembled.")!
        BookDataViewModel.books.append(book1)
        
        let book2 = Book(title: "Gone with the Wind", author: "Margaret Mitchell", totalPages: 321, currentPage: 0, photo: UIImage(named: "gone"), isbn: "32674754745745", publisher: "Goodreads", description: "American classic in which a manipulative woman and a roguish man carry on a turbulent love affair in the American south during the Civil War and Reconstruction.")!
        BookDataViewModel.books.append(book2)
        
        let book3 = Book(title: "Essays", author: "George Orwell", totalPages: 456, currentPage: 0, photo: UIImage(named: "essays"), isbn: "234786865865", publisher: "Goodreads", description: "Eric Arthur Blair, known by his pen name George Orwell, was an English novelist, essayist, journalist and critic. His work is characterised by lucid prose, biting social criticism, opposition to totalitarianism, and outspoken support of democratic socialism.")!
        BookDataViewModel.books.append(book3)
        
        let book4 = Book(title: "Cloud Computing", author: "John Smith", totalPages: 543, currentPage: 0, photo: UIImage(named: "cloud"), isbn: "23434647427547", publisher: "Goodreads", description: "Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user. The term is generally used to describe data centers available to many users over the Internet.")!
        BookDataViewModel.books.append(book4)
        
        let book5 = Book(title: "Introduction to Java Programming", author: "Paul Jones", totalPages: 234, currentPage: 0, photo: UIImage(named: "intro"), isbn: "567845435434", publisher: "Goodreads", description: "The Fundamentals of Java Programming: A Complete Beginners Guide to Java Programming Mastery by Paul Jones")!
        BookDataViewModel.books.append(book5)
        
        let book6 = Book(title: "Lord of the Flies", author: "William Golding", totalPages: 356, currentPage: 0, photo: UIImage(named: "lord"), isbn: "7636453463436", publisher: "Goodreads", description: "Lord of the Flies is a 1954 novel by Nobel Prize-winning British author William Golding. The book focuses on a group of British boys stranded on an uninhabited island and their disastrous attempt to govern themselves.")!
        BookDataViewModel.books.append(book6)
        
        let book7 = Book(title: "Catch 22", author: "Joseph Heller", totalPages: 456, currentPage: 0, photo: UIImage(named: "catch"), isbn: "84364364364363463", publisher: "Goodreads", description: "Catch-22 is a satirical war novel by American author Joseph Heller. He began writing it in 1953; the novel was first published in 1961.")!
        BookDataViewModel.books.append(book7)
        
        let book8 = Book(title: "Middlemarch", author: "George Elliot", totalPages: 121, currentPage: 0, photo: UIImage(named: "middle"), isbn: "523532532532532", publisher: "Goodreads", description: "Middlemarch, A Study of Provincial Life is a novel by the English author Mary Anne Evans, under the pen name George Eliot. It first appeared in eight instalments in 1871 and 1872. Set in a fictitious English Midland town from 1829 to 1832, it follows distinct, intersecting stories with many characters.")!
        BookDataViewModel.books.append(book8)
        
        let book9 = Book(title: "The Time Machine", author: "H.G. Wells", totalPages: 333, currentPage: 0, photo: UIImage(named: "time"), isbn: "75235466544423", publisher: "Goodreads", description: "The Time Machine is a science fiction novella by H. G. Wells, published in 1895 and written as a frame narrative. The work is generally credited with the popularization of the concept of time travel by using a vehicle or device to travel purposely and selectively forward or backward through time.")!
        BookDataViewModel.books.append(book9)
        
    }
    
    
}

