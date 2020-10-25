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
    
//    let testImage = UIImage(named: "h_g_wells")!
    var testStudent: Student = Student(name: "testStudentName", fullName: "full name", studentNumber: "s123456", description: "test desciption", image: UIImage(named: "h_g_wells")!, hobbies: "testing hobby", additionalInfo: "I like making unit tests")
   

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // init(name:String, fullName:String, studentNumber:String, description:String, image:UIImage, hobbies:String, additionalInfo:String)

//        testStudent = Student(name: "testStudentName", fullName: "full name", studentNumber: "s123456", description: "test desciption", image: UIImage(named: "h_g_wells")!, hobbies: "testing hobby", additionalInfo: "I like making unit tests")
       
//        testStudent = Student(name: "testStudentName", fullName: "full name", studentNumber: "s123456", description: "test desciption", image: testImage, hobbies: "testing hobby", additionalInfo: "I like making unit tests")
//        var studentName = testStudent.name
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
