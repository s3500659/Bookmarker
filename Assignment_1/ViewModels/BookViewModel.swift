//
//  BookViewModel.swift
//  Assignment_1
//
//  Created by Josh on 15/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit

struct bookViewModel {
    private var model = requestBook.shared

    //receive feedback from the api
    var delegate: Refresh? {
        get {
            return model.delegate
        }
        set(value) {
            model.delegate = value
        }
    }

    var books: [Books] {
        return model.getBooks
    }

    var count: Int {
        return books.count
    }


    func getBook(index: Int) -> Books {
        return books[index]
    }

    func getBook(searchTerm: String, queryType: Int) {
        model.getBook(searchTerm: searchTerm, queryType: queryType)
    }

}
