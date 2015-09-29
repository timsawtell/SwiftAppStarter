//
//  AppDelegate.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class BookBuilder: Builder {

    class func objFromJSONDict(json: NSDictionary) ->Book {
        let book = Book()
        BookBuilder.updateObjWithJSONDict(book, json: json)
        return book
    }
    
    class func updateObjWithJSONDict(obj: Book, json: NSDictionary) ->Book {
        
        obj.title = safeAssign(json["trackName"], defaultValue: "Unknown") as? String
        obj.price = safeAssign(json["price"], defaultValue: 0.00) as? String
        obj.blurb = safeAssign(json["description"], defaultValue: "Unknown") as? String
        return obj
    }

}