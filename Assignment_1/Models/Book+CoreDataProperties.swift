//
//  Book+CoreDataProperties.swift
//  Assignment_1
//
//  Created by Josh on 23/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

//todo make book
extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String
    @NSManaged public var currentPage: Int32
    @NSManaged public var desc: String
    @NSManaged public var isbn: String
    @NSManaged public var photo: Data?
    @NSManaged public var publisher: String
    @NSManaged public var startDate: Date?
    @NSManaged public var title: String
    @NSManaged public var totalPages: Int32
    @NSManaged public var favourite: Bool
    @NSManaged public var notes: String?
}
