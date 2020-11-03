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

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var bookLibrary: [Book] = []
    private var favouriteBooks: [Book] = []
    // tested
    func favouriteCount() -> Int {
        return favouriteBooks.count
    }

    func getFavourites() -> [Book] {
        return favouriteBooks
    }

    func getFavourite(index: Int) -> Book {
        return favouriteBooks[index]
    }
    // tested
    func loadFavourites() {
        favouriteBooks = []
        for book in bookLibrary {
            if book.favourite == true {
                favouriteBooks.append(book)
            }
        }
    }
    // tested
    func addFavourite(book: Book) {
        book.favourite = true
        let (_, _) = saveBook()
        fetchBooks()
        loadFavourites()
    }
    // tested
    func removeFavourite(rowIndex: Int) {
        favouriteBooks[rowIndex].favourite=false
        let (_, _) = saveBook()
        fetchBooks()
        loadFavourites()
    }

    var getBooks: [Book] {
        fetchBooks()
        return bookLibrary
    }
    // tested
    func getCount() -> Int {
        return bookLibrary.count
    }
    // tested
    func checkBookTitleInLibrary (bookTitle: String) -> Bool {
        for book in bookLibrary {
            if book.title == bookTitle {
                return true
            }
        }
        return false
       
    }

    public func getBook(indexRow: Int) -> Book {
        return bookLibrary[indexRow]
    }

    func fetchBooks() {
        do {
            bookLibrary = try context.fetch(Book.fetchRequest()) 
        } catch let error {
            print("Error getting books: \(error)")
        }
    }
    //tested
    func removeBook(rowIndex: Int) {
        context.delete(bookLibrary[rowIndex])
        let (_, _) = saveBook()
        fetchBooks()
    }
    //tested
    func addBook(book: Book) {
        var image: UIImage? = nil
        if (book.photo != nil){
            image = UIImage(data: book.photo!)
        }
        let localBook = createBook(title: book.title, author: book.author, totalPages: intmax_t(book.totalPages), currentPage: intmax_t(book.currentPage), photo: image, isbn: book.isbn, publisher: book.publisher, desc: book.desc, needSave: true)
        
        bookLibrary.append(localBook!)
        let (_, _) = saveBook()
        fetchBooks()
    }
    //tested
    func createBook(title: String, author: String, totalPages: intmax_t, currentPage: intmax_t, photo: UIImage?, isbn: String, publisher: String, desc: String, needSave:Bool) -> Book? {
        let newBook = Book(needSave: needSave, context: context)
        guard (currentPage >= 0 && currentPage <= totalPages && !title.isEmpty) else {
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
        newBook.notes = nil
        if let photo = photo {
            newBook.photo = photo.jpegData(compressionQuality: 1.0)
        }
        return newBook
    }
    // tested positive
    func updateStartDate(book: Book, date: Date) -> (Bool, String) {
        if date > Date() {
            return (false, "Start date cannot be greater than today")
        }
        book.startDate = date
        let (savedBook, error) = saveBook()
        return (savedBook, error)
    }
    // tested positve 
    func updateNotes(book: Book, notes: String) -> (Bool, String) {
        if book.notes != notes {
            book.notes = notes
            let (savedBook, error) = saveBook()
            return (savedBook, error)
        }
        return (true, "")
    }
    // tested positve
    func updatePage(book: Book, page: Int32) -> (Bool, String) {
        if page > book.totalPages {
            return (false, "Current page cannot be greater than the total pages")
        }
        book.currentPage = page
        let (savedBook, error) = saveBook()
        return (savedBook, error)
    }
    // tested
    private func saveBook() -> (Bool, String) {
        do {
            try context.save()
        } catch let error {
            return (false, error.localizedDescription)
        }
        return (true, "")
    }
}
