//
//  AuthorBuilder.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class AuthorBuilder: Builder {
    
    class func objFromJSONDict(json: NSDictionary) -> Author {
        let author = Author()
        AuthorBuilder.updateObjWithJSONDict(author, json: json)
        return author
    }
    
    class func updateObjWithJSONDict(obj: Author, json: NSDictionary) ->Author {
        
        obj.name = safeAssign(json["artistName"], defaultValue: "Unknown") as? String
        return obj
    }
    
}