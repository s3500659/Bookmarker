//
//  BookApi.swift
//  Assignment_1
//
//  Created by Josh on 15/10/20.
//  Copyright © 2020 Vinh Tran. All rights reserved.
//

import Foundation

/*
protocol Refresh{
    func updateUI()
}
 */

//todo include the different urls here
enum requestType{
    
}


class requestBook{
    private var books:[Book]=[]
   // var delegate:Refresh?
    private let session = URLSession.shared
    private let baseUrl:String = "https://www.googleapis.com/books/v1/volumes"
    private let titleQuery = "?q="

    //todo escape html
    
    
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
            getData(request,element: "results")
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

