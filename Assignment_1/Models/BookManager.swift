//
//  BookManager.swift
//  Assignment_1
//
//  Created by Josh on 23/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class BookManager {
    
    public static let shared = BookManager()

//ref to managed obj context
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var bookLibrary: [Book] = []
    private var favouriteBooks: [Book] = []
    
    private init() {
        
    }

    func loadBooks() {
        fetchBooks()
    }

    func favouriteCount() -> Int {
        return favouriteBooks.count
    }

    func getFavourites() -> [Book] {
        return favouriteBooks
    }

    func getFavourite(index: Int) -> Book {
        return favouriteBooks[index]
    }

    func loadFavourites() {
        favouriteBooks=[]
        for book in bookLibrary {
            if book.favourite==true {
                favouriteBooks.append(book)
            }
        }
    }


    func addFavourite(book: Book) {
        book.favourite = true
        do { //save the change
            try context.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        fetchBooks()
        loadFavourites()
    }


    func removeFavourite(rowIndex: Int) {
        favouriteBooks[rowIndex].favourite=false
        do { //save the change
            try context.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        //update the book data
        fetchBooks()
        loadFavourites()
    }


    var getBooks: [Book] {
        fetchBooks() //get the latest
        return bookLibrary
    }

    func getCount() -> Int {
        return bookLibrary.count
    }

    public func getBook(indexRow: Int) -> Book {
        return bookLibrary[indexRow]
    }

//gets all the books from coredata
    func fetchBooks() {
        do {
            bookLibrary = try context.fetch(Book.fetchRequest()) 
        } catch let error {
            print("Error getting books: \(error)")
        }
    }

    func removeBook(rowIndex: Int) {
        context.delete(bookLibrary[rowIndex])
        do { //save the change
            try context.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        fetchBooks() //update the book data
    }


    func addBook(book: Book) {
        var image: UIImage? = nil
        if (book.photo != nil){
            image = UIImage(data: book.photo!)
        }
        let localBook = createBook(title: book.title, author: book.author, totalPages: intmax_t(book.totalPages), currentPage: intmax_t(book.currentPage), photo: image, isbn: book.isbn, publisher: book.publisher, desc: book.desc, needSave: true)
        
        bookLibrary.append(localBook!)
        do { //save it into coredata
            try context.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        fetchBooks() //update the book data
    }

    func createBook(title: String, author: String, totalPages: intmax_t, currentPage: intmax_t, photo: UIImage?, isbn: String, publisher: String, desc: String, needSave:Bool) -> Book? {
        
        //create  a new book
        let newBook = Book(needSave: needSave, context: context)
        //current page can't be less than zero, total pages can't be less than current pages, title must exist
        guard (currentPage >= 0 && currentPage <= totalPages && !title.isEmpty) else {
            //todo handle
            print("Invalid book")
            return nil
        }
        newBook.title = title
        newBook.author = author
        newBook.totalPages = Int32(totalPages)
        newBook.currentPage = Int32(currentPage)
        newBook.isbn = isbn
        newBook.publisher = publisher
        newBook.desc = desc
        newBook.notes = "Enter notes here"
        if let photo = photo {
            newBook.photo = photo.jpegData(compressionQuality: 1.0)
        }
        return newBook
    }

    func updateStart() {

    }

    func updateNotes() {

    }

    func updatePage() {

    }
}
