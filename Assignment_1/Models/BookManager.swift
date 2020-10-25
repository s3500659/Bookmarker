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

//ref to managed obj context
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var bookLibrary: [Book] = []
    private var favouriteBooks: [Book] = []

    func loadBooks() {
        //addBook(title: "test", author: "test", totalPages: 20, currentPage: 1, photo: UIImage(named: "gone"), isbn: "1238382123", publisher: "good reads", desc: "Learn to eat well with more than 100 approachable and delicious meatless recipes designed for everyone—vegetarians, vegans, and meat-eaters alike—with substitutions to make meals special diet–friendly (gluten-free, dairy-free, and egg-free) whenever possible")
        fetchBooks()
    }

    func favouriteCount() -> Int {
        return favouriteBooks.count
    }

    func getFavourites() -> [Book] {
        return favouriteBooks
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
        print(favouriteBooks[0].favourite)
    }

    func getFavourite(index: Int) -> Book {
        return favouriteBooks[index]
    }

    func removeFavourite(rowIndex: Int) {
        context.delete(favouriteBooks[rowIndex])
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
            //refresh the table view in the main thread
            DispatchQueue.main.async {
                //self.tableView.reloadData()
            }
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

    func updateStart() {

    }

    func updateNotes() {

    }

    func updatePage() {

    }

    func addBook(book: Book) {
        bookLibrary.append(book)
        do { //save it into coredata
            try context.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        fetchBooks() //update the book data
    }

    func createBook(title: String, author: String, totalPages: intmax_t, currentPage: intmax_t, photo: UIImage?, isbn: String, publisher: String, desc: String) -> Book? {
        //create  a new book
        let newBook = Book(context: context)
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


    func addBook(title: String, author: String, totalPages: intmax_t, currentPage: intmax_t, photo: UIImage?, isbn: String, publisher: String, desc: String) {
        //current page can't be less than zero, total pages can't be less than current pages, title must exist
        guard (currentPage >= 0 && currentPage <= totalPages && !title.isEmpty) else {
            return
        }
        //create  a new book
        let newBook = Book(context: context)
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
        do { //save it into coredata
            try context.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        fetchBooks() //update the book data
    }
}
