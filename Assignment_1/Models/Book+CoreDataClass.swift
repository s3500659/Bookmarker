//
//  Book+CoreDataClass.swift
//  Assignment_1
//
//  Created by Josh on 23/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Book)
public class Book: NSManagedObject {
    
    convenience init(needSave: Bool,  context: NSManagedObjectContext?) {
        let entity = NSEntityDescription.entity(forEntityName: "Book", in: context!)
        
        if(!needSave) {
            self.init(entity: entity!, insertInto: nil)
        } else {
            self.init(entity: entity!, insertInto: context)
        }
    }
}
