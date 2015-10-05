//
//  Book.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Book: NSObject, NSSecureCoding {
    var title: String?
    var price: String?
    var blurb: String?
    
    weak var author: Author? // books don't own Authors, Authors own books.
    
    override init () {
        
    }
    
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.price, forKey: "price")
        aCoder.encodeObject(self.blurb, forKey: "blurb")
        aCoder.encodeObject(self.author, forKey: "author")
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey("title") as? String
        self.price = aDecoder.decodeObjectForKey("price") as? String
        self.blurb = aDecoder.decodeObjectForKey("blurb") as? String
        self.author = aDecoder.decodeObjectForKey("author") as? Author
    }
    
    @objc static func supportsSecureCoding() -> Bool {
        return true
    }
}