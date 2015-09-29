//
//  Author.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Author: ModelObject {
    var name: String?
    lazy var books: [Book] = {
        return [Book]() // initialise the array when you first need it
        }()
    
    init () {
        
    }
    
    init (name: String) {
        self.name = name
    }
    
    func addBook(book: Book) -> Void {
        books.append(book)
        book.author = self
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