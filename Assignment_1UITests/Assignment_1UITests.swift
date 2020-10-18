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
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
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
//    func testRecord() {
//
//
//        let tabBarsQuery = XCUIApplication().tabBars
//        tabBarsQuery.buttons["Search Books"].tap()
//        tabBarsQuery.buttons["Profile"].tap()
//        tabBarsQuery.buttons["Students"].tap()
//
//
//    }

}
