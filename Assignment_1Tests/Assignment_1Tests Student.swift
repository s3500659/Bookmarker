//
//  Assignment_1Tests.swift
//  Assignment_1Tests
//
//  Created by Vinh Tran on 7/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import XCTest
@testable import Assignment_1

class Assignment_1Tests_Student: XCTestCase {
    
    //    let testImage = UIImage(named: "h_g_wells")!
    var testStudent: Student = Student(name: "testStudentName", fullName: "full name", studentNumber: "s123456", description: "test desciption", image: UIImage(named: "h_g_wells")!, hobbies: "testing hobby", additionalInfo: "I like making unit tests")
    
    var testStudents: [Student] = []
    var viewModel = StudentViewModel()
    
    override func setUp() {
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidStudentName() {
        //test that Student object can be created with a first name
        let expectedResult: String = "testStudentName"
        XCTAssertNotNil(testStudent.name)
        XCTAssertTrue(testStudent.name == expectedResult, "Student name is not working correctly, expected: \(expectedResult) is not the same as actual Name: \(testStudent.name)")
        
    }
    
    func testValidStudentFullName() {
        //test that Student object can be created with a full name
        let expectedResult: String = "full name"
        XCTAssertNotNil(testStudent.fullName)
        XCTAssertTrue(testStudent.fullName == expectedResult, "Student fullname is not working correctly, expected: \(expectedResult) is not the same as actual Full Name: \(testStudent.fullName)")
        
    }
    
    func testValidStudentNumber() {
        //test that Student object can be created with a student number
        let expectedResult: String = "s123456"
        XCTAssertNotNil(testStudent.studentNumber)
        XCTAssertTrue(testStudent.studentNumber == expectedResult, "Student Number is not working correctly, expected: \(expectedResult) is not the same as actual Student Number: \(testStudent.studentNumber)")
        
    }
    
    
    func testValidDescription() {
        //test that Student object can be created with a description
        let expectedResult: String = "test desciption"

        XCTAssertNotNil(testStudent.description)
        XCTAssertTrue(testStudent.description == expectedResult, "Student Description is not working correctly, expected: \(expectedResult) is not the same as actual Description: \(testStudent.description)")
        
    }
    
    func testValidImage() {
        //test that Student object can be created with a image
        let expectedResult: UIImage = UIImage(named: "h_g_wells")!
        XCTAssertNotNil(testStudent.image)
        XCTAssertTrue(testStudent.image == expectedResult, "Student image is not working correctly, expected: \(expectedResult) is not the same as actual Description: \(testStudent.image)")
        
    }
    
    func testValidHobbies() {
        //test that Student object can be created with hobbies
        let expectedResult: String = "testing hobby"
        XCTAssertNotNil(testStudent.hobbies)
        XCTAssertTrue(testStudent.hobbies == expectedResult, "Student Hobbies is not working correctly, expected: \(expectedResult) is not the same as actual Hobbies: \(testStudent.hobbies)")
        
    }
    
    func testValidAdditionInfo() {
        //test that Student object can be created with a additional info
        let expectedResult: String =  "I like making unit tests"
        XCTAssertNotNil(testStudent.additionalInfo)
        XCTAssertTrue(testStudent.additionalInfo == expectedResult, "testing Additional Info is not working correctly, expected: \(expectedResult) is not the same as actual Addtional Infor: \(testStudent.additionalInfo)")
        
    }
    
    func testPopStudents() {
        //test that Student object can be created with a description
        let expectedResult: Int =  4
        let viewModel = StudentViewModel()
        let numStudents = viewModel.students.count
//        XCTAssertNotNil(testStudent.description)
        XCTAssertTrue(numStudents == expectedResult, "Problem with the Student View Model - did not create all 4 Students, expected: \(expectedResult) is not the same as actual Number Students: \(numStudents)")
        
    }
       

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
