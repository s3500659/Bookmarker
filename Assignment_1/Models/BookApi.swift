//
//  BookApi.swift
//  Assignment_1
//
//  Created by Josh on 15/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation
import UIKit

/*
 protocol Refresh{
 func updateUI()
 }
 */

//todo include the different urls here
enum requestType{
    
}

private struct dataItems:Decodable{
    let items: [bookApiData]?
    
}

private struct bookApiData: Decodable{
    let volumeInfo: VolumeInfo
    
    struct VolumeInfo:Decodable{
        let title: String?
        let authors: [String]?
        let description: String?
        let pageCount: Int?
        let publisher:String?
        let imageLinks: ImageLinks?
        let industryIdentifier:[IndustryIdentifier]?
        
        struct IndustryIdentifier:Decodable{
            let type:String
            let identifier: String
        }
        struct ImageLinks: Decodable {
            let smallThumbnail: URL?
            let thumbnail: URL?
        }
    }
}


class requestBook{
    private var books:[Book]=[]
    // var delegate:Refresh?
    private let session = URLSession.shared
    private let baseUrl:String = "https://www.googleapis.com/books/v1/volumes"
    private let titleQuery = "?q="
    
    var getBooks:[Book]{
        return books
    }
    
    func getBook(withQuery:String){
        books=[]
        let url = baseUrl+titleQuery+withQuery
        guard let escapedAddres=url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        
        if let url = URL(string: escapedAddres){
            let request = URLRequest(url: url)
            fetchData(request)
        }
    }
    
    
    //helper function to make UIImages
    private func createPhoto(imageUrl:URL?)->UIImage?{
        let data = try? Data(contentsOf:imageUrl!)
        let image: UIImage? = nil
        if let imageData = data{
            return UIImage(data:imageData)
        }else{
            return image
        }
    }
    
    private func authorsToString(authors:[String?])->String{
        var authorText:String=""
        for author in authors{
            if author != nil{
                authorText.append(author!)
            }
        }
        return authorText
    }
    
    //MARK: retrieve and parse data from the Google books API
    func fetchData(_ request:URLRequest){
        let jsonDecoder = JSONDecoder()
        let task = session.dataTask(with: request,completionHandler:{ data,response,downloadError in
            if let error = downloadError{
                print(error)
            } else{
                do{
                    let parsedResponse = try jsonDecoder.decode(dataItems.self,from:data!)
                    let responseItems = parsedResponse.items!
                    for book in responseItems{
                        self.books.append(Book(title: book.volumeInfo.title!, author:"author", totalPages: book.volumeInfo.pageCount!, currentPage: 0, photo:self.createPhoto(imageUrl: book.volumeInfo.imageLinks?.smallThumbnail), isbn: "isbn", publisher: book.volumeInfo.publisher!, description:book.volumeInfo.description!)!)
                    }
                    DispatchQueue.main.async {
                    //self.delegate?.updateUI()
                    }
                    print(self.books)
                }catch{
                    print(error)
                }
            }
        })
        task.resume()
    }
    private init(){}
    static let shared = requestBook()


}

