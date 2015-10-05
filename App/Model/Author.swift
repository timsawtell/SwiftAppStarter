//
//  Author.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Author: NSObject, NSSecureCoding {
    var name: String?
    var books: [Book]
    
    override init () {
        self.books = [Book]()
    }
    
    init (name: String) {
        self.name = name
        self.books = [Book]()
    }
    
    func addBook(book: Book) -> Void {
        books.append(book)
        book.author = self
    }
    
    func bookWithTitle(title: String) -> Book? {
        return self.books.filter { $0.title == title}.first
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.books, forKey: "books")
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.books = aDecoder.decodeObjectForKey("books") as! [Book]
    }
    
    @objc static func supportsSecureCoding() -> Bool {
        return true
    }
}