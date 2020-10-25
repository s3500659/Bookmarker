//
//  Book+CoreDataProperties.swift
//  Assignment_1
//
//  Created by admin on 23/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

//todo make book
extension Books {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Books> {
        return NSFetchRequest<Books>(entityName: "Books")
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
    @NSManaged public var notes: String




    /*

    convenience init(title: String,
                     author: String,
                     totalPages: intmax_t,
                     currentPage: intmax_t,
                     photo: UIImage?,
                     isbn: String,
                     publisher: String,
                     desc: String){
        //current page can't be less than zero, total pages can't be less than current pages, title must exist
        guard (currentPage >= 0 && currentPage <= totalPages && !title.isEmpty) else {
            return
        }
        let title = title
        let author = author
        let totalPages = Int32(totalPages)
        let currentPage = Int32(currentPage)
        let isbn = isbn
        let  publisher = publisher
        let  desc = desc
        if let photo = photo {
            self.photo = photo.jpegData(compressionQuality: 1.0)
        }
        self.init(title: title,
                author: author,
                totalPages:
                totalPages,
                currentPage: currentPage,
                photo: photo,
                isbn: isbn,
                publisher: publisher,
                desc: desc)
    }
    */
}
