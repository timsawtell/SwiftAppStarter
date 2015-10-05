//
//  DemoViewController.swift
//  TSBoilerplateSwift
//
//  Created by Tim Sawtell on 9/07/2014.
//  Copyright (c) 2014 Sawtell Software. All rights reserved.
//

import UIKit

class DemoViewController: TSViewController {
    @IBOutlet var tf1: UITextField?
    @IBOutlet var tf2: UITextField?
    @IBOutlet var tf3: UITextField?
    
    override func viewDidLoad()  {
        if (tf1 != nil) { inputFields.addObject(tf1!) }
        if (tf2 != nil) { inputFields.addObject(tf2!) }
        if (tf3 != nil) { inputFields.addObject(tf3!) }
        super.viewDidLoad()
    }
        
    override func wantsPullToRefresh() -> Bool {
        return true
    }
    
    override func wantsPullToRefreshFooter() -> Bool {
        return true
    }
    
    @IBAction func runCommandTouched(sender: AnyObject) {
        let cmd = iTunesSearchCommand()
        cmd.commandCompletionBlock = { error in
            if ( error != nil ) {
                NSLog("Encountered an error: \(error?.localizedDescription)")
            } else {
                if let book = GlobalModel.person.bookshelf.books!.first {
                    NSLog( "Search results: \(book.title), by: \(book.author?.name)" )
                }
            }
            GlobalModel.save()
        }
        GlobalCommandRunner.executeCommand(cmd)
    }
}
