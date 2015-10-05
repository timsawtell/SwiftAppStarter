//
//  Bookshelf.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 10/5/15.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Bookshelf: NSObject, NSSecureCoding {
    var authors: [Author]?
    var books: [Book]?
    
    override init () {
        
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.authors, forKey: "authors")
        aCoder.encodeObject(self.books, forKey: "books")
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        self.authors = aDecoder.decodeObjectForKey("authors") as? [Author]
        self.books = aDecoder.decodeObjectForKey("books") as? [Book]
    }
    
    @objc static func supportsSecureCoding() -> Bool {
        return true
    }
    
    func addBook(book: Book) -> Void {
        if var authors = self.authors {
            if !authors.contains(book.author!) {
                authors.append(book.author!)
            }
        } else {
            authors = [book.author!]
        }
        if var books = self.books {
            if !(books.contains(book)) {
                books.append(book)
            }
        } else {
            books = [book]
        }
    }
    
    func authorWithName(name: String) -> Author? {
        if let authors = self.authors {
            return authors.filter{ $0.name! == name }.first
        }
        return nil
    }
    
    func bookWithTitle(bookTitle: String, authorName: String) -> Book? {
        if let author = self.authorWithName(authorName) {
            return author.bookWithTitle(bookTitle)
        }
        return nil
    }
}