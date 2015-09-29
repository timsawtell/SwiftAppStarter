//
//  AppDelegate.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class Builder {
    class func safeAssign(attemptValue: AnyObject?, defaultValue: AnyObject) ->AnyObject {
        if let realValue: AnyObject = attemptValue {
            return realValue
        }
        return defaultValue
    }
}