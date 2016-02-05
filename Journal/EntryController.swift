//
//  EntryController.swift
//  Journal
//
//  Created by Andrew Porter on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedInstance = EntryController()
    
    var entriesArray: [Entry] = []
    
    func addEntry(entry: Entry) {
        entriesArray.append(entry)
    }
    
    func deleteEntry(indexPath: NSIndexPath) {
        entriesArray.removeAtIndex(indexPath.row)
    }
    
}