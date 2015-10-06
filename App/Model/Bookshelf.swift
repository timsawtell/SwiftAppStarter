//
//  Bookshelf.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 10/5/15.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Bookshelf: NSObject, NSSecureCoding {
    var authors = [Author]()
    var books = [Book]()
    
    override init () {
        
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.authors, forKey: "authors")
        aCoder.encodeObject(self.books, forKey: "books")
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        self.authors = (aDecoder.decodeObjectForKey("authors") as? [Author])!
        self.books = (aDecoder.decodeObjectForKey("books") as? [Book])!
    }
    
    @objc static func supportsSecureCoding() -> Bool {
        return true
    }
    
    func addBook(book: Book) -> Void {
        if !authors.contains(book.author!) {
            authors.append(book.author!)
        }
        if !(books.contains(book)) {
            books.append(book)
        }
    }
    
    func authorWithName(name: String) -> Author? {
        return authors.filter{ $0.name! == name }.first
    }
    
    func bookWithTitle(bookTitle: String, author: Author) -> Book? {
        return author.bookWithTitle(bookTitle)
    }
}