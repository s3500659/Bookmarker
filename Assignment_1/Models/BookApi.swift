//
//  BookApi.swift
//  Assignment_1
//
//  Created by Josh on 15/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit


protocol Refresh {
    func updateUI()
}


private struct dataItems: Decodable {
    let items: [bookApiData]?
}

private struct bookApiData: Decodable {
    let volumeInfo: VolumeInfo

    struct VolumeInfo: Decodable {
        let title: String
        let authors: [String]?
        let description: String?
        let pageCount: Int?
        let publisher: String?
        let imageLinks: ImageLinks?
        let industryIdentifiers: [IndustryIdentifiers]?

        struct IndustryIdentifiers: Decodable {
            let type: String
            let identifier: String
        }

        struct ImageLinks: Decodable {
            let smallThumbnail: URL?
            let thumbnail: URL?
        }
    }
}


class requestBook {
    private var books: [Books] = []
    private let bookManager = BookManager()
    var delegate: Refresh?
    private let session = URLSession.shared
    private let apiKey = ""
    private let baseUrl: String = "https://www.googleapis.com/books/v1/volumes"

    var getBooks: [Books] {
        return books
    }

    func getBook(searchTerm: String, queryType: Int) {
        books = []
        var queryURI = ""
        switch queryType {
        case 1:
            queryURI = "?q=inauthor:"
        case 2:
            queryURI = "?q=isbn:"
        default:
            queryURI = "?q=intitle:"
        }
        let url = baseUrl + queryURI + searchTerm
        guard let escapedAddres = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        if let url = URL(string: escapedAddres) {
            let request = URLRequest(url: url)
            fetchData(request)
        }
    }


    //helper function to make UIImages
    private func createPhoto(imageUrl: URL?) -> UIImage? {
        if imageUrl == nil {
            return nil
        }
        //change http urls to be https
        var components = URLComponents(url: imageUrl!, resolvingAgainstBaseURL: false)!
        components.scheme = "https"
        let httpsImageUrl = components.url!
        let data = try? Data(contentsOf: httpsImageUrl)
        let image: UIImage? = nil
        if let imageData = data {
            return UIImage(data: imageData)
        } else {
            return image
        }
    }

    private func authorsToString(authors: [String?]) -> String? {
        var authorText: String = ""
        for author in authors {
            if author != nil {
                authorText.append(author! + "\t")
            }
        }
        return authorText
    }

    //MARK: -helper performs data sanitization
    private func createBook(parsedResponse: dataItems) {
        guard let responseItems = parsedResponse.items else{return}
        //create book objects and handle optionals
        for book in responseItems {
            let description = book.volumeInfo.description ?? "no description"
            let pageCount = book.volumeInfo.pageCount ?? 0
            let publisher = book.volumeInfo.publisher ?? "no publisher"
            var authors="no authors"
            if let authorsList = book.volumeInfo.authors{
                authors = authorsToString(authors: authorsList) ?? "no authors"
            }
            let isbn = book.volumeInfo.industryIdentifiers?[0].identifier ?? "no isbn"
            if let book = bookManager.createBook(title: book.volumeInfo.title, author: authors, totalPages: pageCount, currentPage: 0, photo: self.createPhoto(imageUrl: book.volumeInfo.imageLinks?.smallThumbnail), isbn: isbn, publisher: publisher, desc: description){
                self.books.append(book)
            }
        }
    }

    //MARK: -retrieve and parse data from the Google books API
    func fetchData(_ request: URLRequest) {
        let jsonDecoder = JSONDecoder()
        let task = session.dataTask(with: request, completionHandler: { data, response, downloadError in
            if let error = downloadError {
                print(error)
            } else {
                do {
                    let parsedResponse = try jsonDecoder.decode(dataItems.self, from: data!)
                    //parse the data into book objects
                    self.createBook(parsedResponse: parsedResponse)
                    DispatchQueue.main.async {
                        self.delegate?.updateUI()
                    }
                } catch {
                    print(error)
                }
            }
        })
        task.resume()
    }

    private init() {}

    static let shared = requestBook()
}

