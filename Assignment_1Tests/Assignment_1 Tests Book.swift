//
//  Assignment_1Tests.swift
//  Assignment_1Tests
//
//  Created by Vinh Tran on 7/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import XCTest
@testable import Assignment_1

class Assignment_1Tests_Book: XCTestCase {
    
    var model = requestBook.shared
    var bookModel = BookManager.shared
    //    let testImage = UIImage(named: "h_g_wells")!
    
    override func setUp() {
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testCreateBook() {
        // details for new book
        let bookTitle: String = "Test Book"
        let bookAuthor: String = "test author"
        let bookTotPgs: Int = 200
        let bookCurrPg: Int = 1
        let bookImg = UIImage(named: "h_g_wells")!
        let bookISBN = "123456"
        let bookPub = "test publisher"
        let bookDesc = "test description"
        //        let countBooksBeforeAdding: Int = bookModel.getCount()
        
        // create new book
        guard let newBook = bookModel.createBook(title: bookTitle, author: bookAuthor, totalPages: bookTotPgs, currentPage: bookCurrPg, photo: bookImg, isbn: bookISBN, publisher: bookPub, desc: bookDesc, needSave: true) else { return }
        print(newBook.description)
        // run tests on the new book for each attribute
        XCTAssertTrue(newBook.title == bookTitle, "Book Title is not working correctly, expected: \(bookTitle) is not the same as actual name: \(newBook.title)")
        XCTAssertTrue(newBook.author == bookAuthor, "Book Author is not working correctly, expected: \(bookAuthor) is not the same as actual Author: \(newBook.author)")
        XCTAssertTrue(newBook.totalPages == bookTotPgs, "Book Total Pages is not working correctly, expected: \(bookTotPgs) is not the same as actual Total Pages: \(newBook.totalPages)")
        XCTAssertTrue(newBook.currentPage == bookCurrPg, "Book Current Page is not working correctly, expected: \(bookCurrPg) is not the same as actual Current Page: \(newBook.currentPage)")
        XCTAssertTrue(newBook.isbn == bookISBN, "Book ISBN is not working correctly, expected: \(bookISBN) is not the same as actual ISBN: \(newBook.isbn)")
        XCTAssertTrue(newBook.publisher == bookPub, "Book Publisher is not working correctly, expected: \(bookPub) is not the same as actual Publisher: \(newBook.publisher)")
        XCTAssertTrue(newBook.desc == bookDesc, "Book Description is not working correctly, expected: \(bookDesc) is not the same as actual Description: \(newBook.desc)")
        // add new book
        bookModel.addBook(book: newBook)
        // Test that New Book has been added correctly
        let bookFoundResult = bookModel.checkBookTitleInLibrary(bookTitle: newBook.title)
        XCTAssertTrue(bookFoundResult, "Book Description is not working correctly, expected: \(bookDesc) is not the same as actual Description: \(newBook.desc)")
        //      // delete the book that was added so we don't end up with lots of test books
        bookModel.removeBook(rowIndex: bookModel.getCount()-1)
        
    }
    
    func testAddFavouriteBook() {
        // test the adding of book and making it a favourite
        // create new book
        let bookTitle: String = "Fav Test Book"
        let bookAuthor: String = "Fav test author"
        let bookTotPgs: Int = 1000
        let bookCurrPg: Int = 25
        let bookImg = UIImage(named: "h_g_wells")!
        let bookISBN = "48777"
        let bookPub = "test FavBook publisher"
        let bookDesc = "test FavBook description"
        // get current numnber of fav books
        let currentNumFavBooks: Int = bookModel.favouriteCount()
        let expectedResult: Int = currentNumFavBooks + 1
        
        guard let newFavBook = bookModel.createBook(title: bookTitle, author: bookAuthor, totalPages: bookTotPgs, currentPage: bookCurrPg, photo: bookImg, isbn: bookISBN, publisher: bookPub, desc: bookDesc, needSave: true) else { return }
        print(newFavBook.description)
        bookModel.addBook(book: newFavBook)
        print("number of favourite books\(currentNumFavBooks)")
        bookModel.addFavourite(book: newFavBook)
        print (newFavBook.favourite)
        XCTAssertTrue(newFavBook.title == bookTitle, "Book Title is not working correctly, expected: \(bookTitle) is not the same as actual name: \(newFavBook.title)")
        //        sleep(10)
        XCTAssertTrue(newFavBook.favourite, "Favourite Book is not working as expected, expected: \(expectedResult) is not the same as actual num fav books: \(currentNumFavBooks)")
        bookModel.removeFavourite(rowIndex: bookModel.favouriteCount()-1)
        XCTAssertFalse(newFavBook.favourite, "Remove Favourite Book is not working as expected")
        
        // delete the book that was added so we don't end up with lots of test books
        //        bookModel.removeBook(rowIndex: bookModel.getCount()-1)
        
        
    }
    
    func testFavCountFunctions() {
        // test the count fav functions of the book model
        // create new book
        let bookTitle: String = "Count Fav Test Book"
        let bookAuthor: String = "Count Fav test author"
        let bookTotPgs: Int = 1000
        let bookCurrPg: Int = 25
        let bookImg = UIImage(named: "h_g_wells")!
        let bookISBN = "7447"
        let bookPub = "test count publisher"
        let bookDesc = "test count description"
        // get FAV counts from count functions
        let currentNumFavBooks: Int = bookModel.favouriteCount()
        let expectedResultFavs: Int = currentNumFavBooks + 1
        print ("current number of favs \(bookModel.favouriteCount())")
        guard let newFavBook = bookModel.createBook(title: bookTitle, author: bookAuthor, totalPages: bookTotPgs, currentPage: bookCurrPg, photo: bookImg, isbn: bookISBN, publisher: bookPub, desc: bookDesc, needSave: true) else { return }
        print(newFavBook.desc)
        bookModel.addBook(book: newFavBook)
        bookModel.addFavourite(book: newFavBook)
        //        XCTAssertTrue(expectedResultCountBooks == bookModel.getCount(), "Book Count Func getCount is not working correctly, expected: \(expectedResultCountBooks) is not the same as actual name: \(bookModel.getCount())")
        //        //        sleep(10)
        print ("number of favs after making new book fav \(bookModel.favouriteCount())")
        XCTAssertTrue(expectedResultFavs == bookModel.favouriteCount(), "Book Count Func favouriteCount is not working correctly, expected: \(expectedResultFavs) is not the same as actual name: \(bookModel.favouriteCount())")
        // delete the book that was added so we don't end up with lots of test books
        bookModel.removeBook(rowIndex: bookModel.getCount()-1)
        
        
    }
    
    func testBookCountFunctions() {
        // test the count functions of the book book model
        // create new book
        let bookTitle: String = "Count Test Book"
        let bookAuthor: String = "Count test author"
        let bookTotPgs: Int = 1000
        let bookCurrPg: Int = 25
        let bookImg = UIImage(named: "h_g_wells")!
        let bookISBN = "8744"
        let bookPub = "test count publisher"
        let bookDesc = "test count description"
        // get Book counts from count function
        let currentNumBooks: Int = bookModel.getCount()
        let expectedResultCountBooks: Int = currentNumBooks + 1
        print ("current number of books \(bookModel.getCount())")
        guard let newBookCount = bookModel.createBook(title: bookTitle, author: bookAuthor, totalPages: bookTotPgs, currentPage: bookCurrPg, photo: bookImg, isbn: bookISBN, publisher: bookPub, desc: bookDesc, needSave: true) else { return }
        print(newBookCount.desc)
        bookModel.addBook(book: newBookCount)
        XCTAssertTrue(expectedResultCountBooks == bookModel.getCount(), "Book Count Func getCount is not working correctly, expected: \(expectedResultCountBooks) is not the same as actual name: \(bookModel.getCount())")
        print ("number of books after adding new book \(bookModel.getCount())")
        
        // remove book that was created
        bookModel.removeBook(rowIndex: bookModel.getCount()-1)
        
        
    }
    
    
    func testBookUpdateBookPage() {
        // test the count functions of the book book model
        // create new book
        let bookTitle: String = "Update Book Page"
        let bookAuthor: String = "Count test author"
        let bookTotPgs: Int = 1000
        let bookCurrPg: Int = 500
        let bookImg = UIImage(named: "h_g_wells")!
        let bookISBN = "144"
        let bookPub = "Update Book  publisher"
        let bookDesc = "Update Book  description"
        // expected result
        let expectedResult: Int32 = 999
        //create new book

        guard let newBook = bookModel.createBook(title: bookTitle, author: bookAuthor, totalPages: bookTotPgs, currentPage: bookCurrPg, photo: bookImg, isbn: bookISBN, publisher: bookPub, desc: bookDesc, needSave: true) else { return }
        // add new book
        bookModel.addBook(book: newBook)
        // update book page
        bookModel.updatePage(book: newBook, page: expectedResult)
        
        XCTAssertTrue(newBook.currentPage == expectedResult, "Book Update Book Page Func is not working correctly, expected: \(expectedResult) is not the same as actual Page: \(newBook.currentPage)")
        // remove book that was created
        bookModel.removeBook(rowIndex: bookModel.getCount()-1)
        
        
    }
    
    func testBookUpdateNotes() {
        // test the update notes functions of the book model
        // create new book
        let bookTitle: String = "Update Notes"
        let bookAuthor: String = "Update Notes author"
        let bookTotPgs: Int = 1000
        let bookCurrPg: Int = 500
        let bookImg = UIImage(named: "h_g_wells")!
        let bookISBN = "1244"
        let bookPub = "Update Notes publisher"
        let bookDesc = "Update Notes description"
        // expected result
        let expectedResult: String = "Notes have been updated"
        //create new book
        
        guard let newBook = bookModel.createBook(title: bookTitle, author: bookAuthor, totalPages: bookTotPgs, currentPage: bookCurrPg, photo: bookImg, isbn: bookISBN, publisher: bookPub, desc: bookDesc, needSave: true) else { return }
        // add new book
        bookModel.addBook(book: newBook)
        // update book page
        bookModel.updateNotes(book: newBook, notes: expectedResult)
        XCTAssertTrue(newBook.notes == expectedResult, "Book Update Notes  Func is not working correctly, expected: \(expectedResult) is not the same as actual Notes: \(String(describing: newBook.notes))")
        // remove book that was created
        bookModel.removeBook(rowIndex: bookModel.getCount()-1)
        
        
    }
    
    func testBookUpdateStartDate() {
        // test the update notes functions of the book model
        // create new book
        let bookTitle: String = "Update Notes"
        let bookAuthor: String = "Update Notes author"
        let bookTotPgs: Int = 1000
        let bookCurrPg: Int = 500
        let bookImg = UIImage(named: "h_g_wells")!
        let bookISBN = "1244"
        let bookPub = "Update Notes publisher"
        let bookDesc = "Update Notes description"
        // expected result
        let expectedResult: Date = Date()
        //create new book
        
        guard let newBook = bookModel.createBook(title: bookTitle, author: bookAuthor, totalPages: bookTotPgs, currentPage: bookCurrPg, photo: bookImg, isbn: bookISBN, publisher: bookPub, desc: bookDesc, needSave: true) else { return }
        // add new book
        bookModel.addBook(book: newBook)
        // update book page
        bookModel.updateStartDate(book: newBook, date: expectedResult)
        XCTAssertTrue(newBook.startDate == expectedResult, "Book Update Start Date  Func is not working correctly, expected: \(expectedResult) is not the same as actual Start Date: \(String(describing: newBook.startDate))")
        // remove book that was created
        bookModel.removeBook(rowIndex: bookModel.getCount()-1)
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
