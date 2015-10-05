//
//  Model.swift
//  TSBoilerplateSwift
//
//  Created by Tim Sawtell on 5/06/2014.
//  Copyright (c) 2014 Sawtell Software. All rights reserved.
//

import Foundation


class Model : NSObject, NSSecureCoding {
    
    var person: Person
    
    override init() {
        person = Person()
    }
    
    func save() {
        let data: NSData = CommandCenter.archiveRootObject(self, key: kModelArchiveKey)!
        if !(data.writeToFile(kPathForModelFile, atomically: true)) {
            NSLog("couldn't write model to disk")
        }
    }
   
    @objc class func supportsSecureCoding() -> Bool {
        return true
    }
    
    // NSSecureCoding
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(person, forKey: "person")
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        person = (aDecoder.decodeObjectForKey("person") as? Person)!
    }
}