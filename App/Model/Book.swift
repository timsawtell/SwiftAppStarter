//
//  Book.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Book: ModelObject {
    var name: String?
    var title: String?
    var price: String?
    var blurb: String?
    
    weak var author: Author? // books don't own Authors, Authors own books.
    
    init () {
        
    }
    
    init (name: String) {
        self.name = name
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.author, forKey: "author")
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.title = aDecoder.decodeObjectForKey("name") as? String
        self.price = aDecoder.decodeObjectForKey("name") as? String
        self.blurb = aDecoder.decodeObjectForKey("name") as? String
        self.author = aDecoder.decodeObjectForKey("author") as? Author
    }
    
    @objc static func supportsSecureCoding() -> Bool {
        return true
    }
}