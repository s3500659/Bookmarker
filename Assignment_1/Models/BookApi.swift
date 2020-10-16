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
            //getData(request,element: "results")
            fetchData(request)
        }
    }
    
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
                        let title=book.volumeInfo.title
                        let authors=book.volumeInfo.authors //todo convert
                        let totalPages=book.volumeInfo.pageCount
                        let photo=self.createPhoto(imageUrl: book.volumeInfo.imageLinks?.smallThumbnail)
                        let description=book.volumeInfo.description
                        let publisher=book.volumeInfo.publisher
                        let isbn = 0
                        let currentPage=0
                    }
                }catch{
                    print(error)
                }
            }
        })
        task.resume()
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
    
    
    func getData(_ request:URLRequest,element:String){
        let task = session.dataTask(with: request,completionHandler:{ data,response,downloadError in
            if let error = downloadError{
                print(error)
            } else{
                var parsedResponse: Any! = nil
                do{
                    parsedResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }catch{
                    print()
                }
                let result = parsedResponse as! [String:Any]
                let AllResults = result["items"] as! [[String:Any]]
                var Allbooks = [Any]()
                
                for result in AllResults{
                    let y = (result["volumeInfo"])
                    Allbooks.append(y!)
                }
                
                let end = Allbooks as! [[String:Any]]
                
                print(end[0])
                
                
                /*
                 if(Allbooks.count>0){
                 for book in Allbooks{
                 let title = book["title"]
                 let authors = book["authors"]
                 let description = book["description"]
                 // let image = book["imageLinks"]["smallThumbnail"]
                 //let isbn13 = book["industryIdentifiers"][0]["identifier"]
                 
                 
                 
                 //  let recipe = Recipe(title:title,url:url,ingredients: ingredients,imageURL:image)
                 //self.books.append(book)
                 }
                 }
                 */
                //send update to main thread, as background threads can't update the ui
                DispatchQueue.main.async {
                    // self.delegate?.updateUI()
                }
                
                //print(Allbooks)
            }
        })
        task.resume()
    }
    private init(){}
    static let shared = requestBook()
}

