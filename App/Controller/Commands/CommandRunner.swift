//
//  CommandRunner.swift
//  SwiftAppStarter
//
//  Created by Tim Sawtell on 29/09/2015.
//  Copyright © 2015 Tim Sawtell. All rights reserved.
//

import Foundation

class CommandRunner {
    
    let sharedOperationQueue = NSOperationQueue()
    
    func executeCommand(command :Command) {
        if let asyncCommand = command as? AsynchronousCommand {
            if asyncCommand.finished || asyncCommand.cancelled { return }
            sharedOperationQueue.addOperation(asyncCommand)
            return
        }
        command.execute()
    }
    
}
