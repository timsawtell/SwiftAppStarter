//
//  iTunesSearchCommand.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation
import Alamofire

/**
* Query the iTunes web service for details on a book, build a Book object with the results and add it to the Model
*/

class iTunesSearchCommand: AsynchronousCommand {
    
    override func execute() {
        weak var weakSelf = self
        let params = ["isbn": "055389692X"]
        let headers = ["Accept": "application/json"]
        
        Alamofire.request(.GET, "http://itunes.apple.com/lookup", parameters: params, headers: headers)
            .responseJSON { request, response, result in
                guard let strongSelf = weakSelf else { return } // if the Command instance doesn't exist anymore, break out early
                
                switch result {
                    case .Success(let JSON):
                        if let resultsArray = JSON["results"] as? NSArray {
                            if let bookDictionary: NSDictionary = resultsArray.objectAtIndex(0) as? NSDictionary {
                                
                                // We don't want to keep adding the same book to the Person's bookshelf, so lookup existing books before trying to add
                                
                                var author = AuthorBuilder.objFromJSONDict(bookDictionary)
                                let book = BookBuilder.objFromJSONDict(bookDictionary)
                                
                                let person: Person = GlobalModel.person
                                
                                if let existingAuthor: Author = person.bookshelf.authorWithName(author.name!) {
                                    author = existingAuthor
                                }
                                
                                if (person.bookshelf.bookWithTitle(book.title!, author: author) != nil) {
                                    self.finish()
                                    return // nothing to see here, the bookshelf already has this book in it
                                }
                                
                                author.addBook(book)
                                person.bookshelf.addBook(book)
                            }
                        }
                        break
                        
                    case .Failure(let data, let error):
                        print("Request failed with error: \(error)")
                        
                        if let data = data {
                            print("Response data: \(NSString(data: data, encoding: NSUTF8StringEncoding)!)")
                        }
                        break
                }
                GlobalModel.save()
                strongSelf.finish()
        }
    }
}