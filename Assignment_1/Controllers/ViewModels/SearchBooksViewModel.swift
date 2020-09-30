//
//  SearchBooksViewModel.swift
//  Assignment_1
//
//  Created by Philip Beeby on 30/9/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit

struct SearchBooksViewModel {
    private (set) var books: [BookData] = []
    // calculated property
    var count: Int{
        return books.count
    }
    
    init(){
        loadData()
    }
    
    private mutating func loadData(){
        books.append(BookData.Book1)
        books.append(BookData.Book2)
        books.append(BookData.Book3)
        books.append(BookData.Book4)
        books.append(BookData.Book5)
        books.append(BookData.Book6)
        books.append(BookData.Book7)
        books.append(BookData.Book8)
        
    }
    func getBooks(byIndex index: Int) -> (title: String, author: String, image: UIImage?){
        let title = books[index].rawValue
        let author =  books[index].author
        let image = UIImage(named: books[index].imageName)
        
        return (title, author, image)
    }
    
}

