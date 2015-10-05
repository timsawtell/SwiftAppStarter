//
//  Person.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Person: NSObject, NSSecureCoding {
    var name: String?
    var bookshelf = Bookshelf()
    
    override init() {
    }
    
    init (name: String) {
        self.name = name
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.bookshelf, forKey: "bookshelf")
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.bookshelf = aDecoder.decodeObjectForKey("bookshelf") as! Bookshelf
    }
    
    @objc static func supportsSecureCoding() -> Bool {
        return true
    }
}
