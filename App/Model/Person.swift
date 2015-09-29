//
//  Person.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Person: ModelObject {
    var name: String?
    lazy var bookshelf: [Book] = {
        return [Book]() // initialise the array when you first need it
        }()
    
    init() {
        
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
        self.bookshelf = aDecoder.decodeObjectForKey("bookshelf") as! [Book]
    }
    
    @objc static func supportsSecureCoding() -> Bool {
        return true
    }
}
