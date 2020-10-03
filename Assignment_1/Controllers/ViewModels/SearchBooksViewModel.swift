//
//  SearchBooksViewModel.swift
//  Assignment_1
//
//  Created by Philip Beeby on 30/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit




/*
struct SearchBooksViewModel {
    private (set) var books: [BookData] = []
    // calculated property
    var count: Int{
        return books.count
    }
    
    init(){
        loadData()
    }
    
    private mutating func loadData(){
        books.append(BookData.Book1)
        books.append(BookData.Book2)
        books.append(BookData.Book3)
        books.append(BookData.Book4)
        books.append(BookData.Book5)
        books.append(BookData.Book6)
        books.append(BookData.Book7)
        books.append(BookData.Book8)
        
    }
    func getBooks(byIndex index: Int) -> (title: String, author: String, image: UIImage?){
        let title = books[index].rawValue
        let author =  books[index].author
        let image = UIImage(named: books[index].imageName)
        
        return (title, author, image)
    }
    
}

*/

struct SearchBooksViewModel {
    var books: [Book?]=[]
    
    
    /*
    func getBooks(byIndex index: Int) -> (title: String?, author: String?, image: UIImage?){
        let title = books[index]?.getTitle()
        let author =  books[index]?.getAuthor()
        let image = books[index]?.getPhoto()
        return (title, author, image)
    }
 */
    func getBook(byIndex: Int) ->Book?{
        return books[byIndex]
    }
    
    
    var count: Int{
        return books.count
    }
    
    
    func getBooks() ->[Book?]{
        return books
    }
    
    
    //inserts temp book data
    mutating func loadData(){

        books.append(Book(title: "Gone in the Wind", author: "Maragret Mitchell", totalPages:200, currentPage:1, photo: UIImage(named: "gone")))

        books.append(Book(title: "Essays", author: "George Orwell", totalPages:200, currentPage:1, photo: UIImage(named: "essays")))
        
        books.append(Book(title: "Cloud Computing", author: "John Smith", totalPages:200, currentPage:1, photo:  UIImage(named: "cloud")))
        
        books.append(Book(title: "Introduction to Java Programming", author: "Paul Jones", totalPages:200, currentPage:1, photo: nil))
        
        books.append(Book(title: "Lord of the Flies", author: "William Golding", totalPages:200, currentPage:1, photo: nil))
        
        books.append(Book(title: "Catch 22", author: "Joseph Heller", totalPages:200, currentPage:1, photo: nil))
        
        books.append(Book(title: "middle", author: "George Elliot", totalPages:200, currentPage:1, photo: nil))
    
        books.append(Book(title: "The Time Machine", author: "H.G. Wells", totalPages:200, currentPage:1, photo: UIImage(named: "essays")))
    }
    
}

