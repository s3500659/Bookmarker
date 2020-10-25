//
//  Assignment_1UITests.swift
//  Assignment_1UITests
//
//  Created by Vinh Tran on 7/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import XCTest


class Assignment_1UITests: XCTestCase {
    
    override func setUp() {
        super.setUp()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTabBarNamesSearch() {
        // test the labels on the Tab Bars are named correctly
        let expectedTabName = "Search Books"
        let tabBarsQuery = XCUIApplication().tabBars
        let testTabBarItem = tabBarsQuery.buttons[expectedTabName].label
        XCTAssertEqual(testTabBarItem, expectedTabName, "Tab Bar Expected Name: \(expectedTabName), Actual Name is \(testTabBarItem)")

    }
    
    func testTabBarNamesmyBooks() {
        // test the labels on the Tab Bars are named correctly
        let expectedTabName = "My Books"
        let tabBarsQuery = XCUIApplication().tabBars
        let testTabBarItem = tabBarsQuery.buttons[expectedTabName].label
        XCTAssertEqual(testTabBarItem, expectedTabName, "Tab Bar Expected Name: \(expectedTabName), Actual Name is \(testTabBarItem)")
        
    }
    
    func testTabBarNamesProfile() {
        // test the labels on the Tab Bars are named correctly
        let expectedTabName = "Profile"
        let tabBarsQuery = XCUIApplication().tabBars
        let testTabBarItem = tabBarsQuery.buttons[expectedTabName].label
        XCTAssertEqual(testTabBarItem, expectedTabName, "Tab Bar Expected Name: \(expectedTabName), Actual Name is \(testTabBarItem)")
        
    }
    
    func testTabBarNamesStudent() {
        // test the labels on the Tab Bars are named correctly
        let expectedTabName = "Students"
        let tabBarsQuery = XCUIApplication().tabBars
        let testTabBarItem = tabBarsQuery.buttons[expectedTabName].label
        XCTAssertEqual(testTabBarItem, expectedTabName, "Tab Bar Expected Name: \(expectedTabName), Actual Name is \(testTabBarItem)")
        
    }
    
    
    
    func testTabBarCount() {
        // test there is one tab bar and only one tab bar
        let expectedTabCount: Int = 1
        let tabBarsQuerycount = XCUIApplication().tabBars.count
        XCTAssertEqual(tabBarsQuerycount, expectedTabCount, "number of tab bar items is incorrect Expected Number: \(expectedTabCount) Actual Number is \(tabBarsQuerycount)")

    }
    
    
    func testAddingFavouriteBook() {
        // this is typical use case for the application
        
        let app = XCUIApplication()
        let plusButton =  app.navigationBars["My Books"].buttons["Add"]
        // number of cells in MyBooks at start of test
        let numMyBookCells = app.tables.cells.count
        // tap the plus button
        plusButton.tap()
        sleep(5)
        // add a book to the favourites
        app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Love Real Food")/*[[".cells.containing(.staticText, identifier:\"ISBN: 896373264373343\")",".cells.containing(.staticText, identifier:\"Kathryn Taylor\")",".cells.containing(.staticText, identifier:\"Love Real Food\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["plus"].tap()
        sleep(5)
        app.toolbars["Toolbar"].buttons["Done"].tap()
        sleep(5)
        // test that the number of cells in the table has increased by one
        XCTAssert(app.tables.cells.count == numMyBookCells+1)
    }

    func testUpdatingPageNumber () {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let searchField = tablesQuery.children(matching: .searchField).element
        let textToEnter: String = "12" // page number to be updated
        let progressLabel = app.staticTexts["progress-label"]
        // test begins
        app.tabBars.buttons["Search Books"].tap()

        sleep(5)
        searchField.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Gone with the Wind"]/*[[".cells.staticTexts[\"Gone with the Wind\"]",".staticTexts[\"Gone with the Wind\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(5)
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).matching(identifier: "Update").element(boundBy: 1).tap()
        sleep(5)
        // enter the text into the text field
        app.alerts["Update current page"].textFields.element.typeText(textToEnter)
        sleep(5)
        app.alerts["Update current page"].buttons["OK"].tap()
        sleep(5)
        // check the first 2 chars are the label are the same as the text that was entered above - if so this means the page number has been updated correctly
        XCTAssert(progressLabel.label.prefix(2) == textToEnter)



        
        
        
 




    }


}
