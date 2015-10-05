//
//  CommandCenter.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class CommandCenter {

    class func securelyArchiveRootObject(object: AnyObject, key: String) -> NSData? {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data);
        archiver.requiresSecureCoding = true
        archiver.encodeObject(object, forKey: key as String)
        archiver.finishEncoding()
        return data
    }
    
    class func securelyUnarchiveData(data: NSData, key: String) -> AnyObject? {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data);
        unarchiver.requiresSecureCoding = true
        let x = unarchiver.decodeObjectForKey(key)
        return x
    }
    
    class func archiveRootObject(object: AnyObject, key: NSString) -> NSData? {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data);
        archiver.encodeObject(object, forKey: key as String)
        archiver.finishEncoding()
        return data
    }
    
    class func unarchiveData(data: NSData, key: String) -> AnyObject? {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data);
        let x = unarchiver.decodeObjectForKey(key)
        return x
    }
    
    class func getModelDataFromDisk() -> Model {
        let model = Model()
        do {
            let data = try NSData(contentsOfFile: kPathForModelFile, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            if let modelInstance = CommandCenter.unarchiveData(data, key: kModelArchiveKey) as? Model {
                return modelInstance
            } else {
                return model
            }
        } catch {
            return model
        }
    }
}