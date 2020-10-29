//
//  Assignment_1Tests.swift
//  Assignment_1Tests
//
//  Created by Vinh Tran on 7/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import XCTest
@testable import Assignment_1

class Assignment_1Tests: XCTestCase {
    
    var model = requestBook.shared
    var bookModel = BookManager.shared
    //    let testImage = UIImage(named: "h_g_wells")!
    var testStudent: Student = Student(name: "testStudentName", fullName: "full name", studentNumber: "s123456", description: "test desciption", image: UIImage(named: "h_g_wells")!, hobbies: "testing hobby", additionalInfo: "I like making unit tests")
    
    
    
    override func setUp() {
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidStudentName() {
        //test that Student object can be created with a first name
        let expectedName: String = "testStudentName"
        XCTAssertNotNil(testStudent.name)
        XCTAssertTrue(testStudent.name == expectedName, "Student name is not working correctly, expected: \(expectedName) is not the same as actual name: \(testStudent.name)")
        
    }
    
    func testValidStudentFullName() {
        //test that Student object can be created with a first name
        let expectedFullName: String = "full name"
        XCTAssertNotNil(testStudent.fullName)
        XCTAssertTrue(testStudent.fullName == expectedFullName, "Student fullname is not working correctly, expected: \(expectedFullName) is not the same as actual name: \(testStudent.fullName)")
        
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
